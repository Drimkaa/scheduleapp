
import 'package:auto_route/annotations.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduleapp/core/utils/time/time_service.dart';
import 'package:scheduleapp/presenter/bloc/lesson/lesson_event.dart';
import 'package:scheduleapp/presenter/bloc/right_menu/right_menu_bloc.dart';
import 'package:scheduleapp/presenter/bloc/right_menu/right_menu_event.dart';
import 'package:scheduleapp/presenter/bloc/week/week_bloc.dart';
import 'package:scheduleapp/presenter/widgets/day_widget.dart';

import '../../core/constants/my_colors.dart';

import '../widgets/bottombar.dart';
import '../widgets/calendar.dart';
import '../widgets/icon_button.dart';
import '../widgets/right_menu/right_menu.dart';

@RoutePage()
class WeekScheduleScreen extends StatelessWidget {
  const WeekScheduleScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _buildAppbar(context),
      body:  PopScope(
        canPop: false,
        onPopInvoked: (e){
          if(BlocProvider.of<WeekPageBloc>(context).state.editMode){
            BlocProvider.of<WeekPageBloc>(context).add(CloseEditMode());
          }


        },
    child:_buildBody(context),
    )
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: BlocSelector<WeekPageBloc, WeekPageState, bool>(
        selector: (state) => state.editMode,
        builder: (_, state) {
          if (state == true) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomColorIconButton(
                  onPressed: () => BlocProvider.of<WeekPageBloc>(_).add(CloseEditMode()),
                  iconData: FluentIcons.dismiss_24_regular,
                  background: MyColors.dark_4,
                  boxShadow: const BoxShadow(
                    color: Colors.black,
                    spreadRadius: 0,
                    blurRadius: 2,
                  ),
                ),
                BlocSelector<WeekPageBloc, WeekPageState, int>(
                    selector: (state2) => state2.selectedCount,
                    builder: (_, count) {
                      return Container(
                        decoration:
                            const BoxDecoration(color: MyColors.dark_1, borderRadius: BorderRadius.all(Radius.circular(18))),
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: Text(
                          count > 0 ? "Выбрано $count" : "Выберите объекты",
                          style: Theme.of(_).textTheme.titleMedium,
                        ),
                      );
                    }),
                BlocSelector<WeekPageBloc, WeekPageState, bool>(
                    selector: (state3) => state3.allSelected,
                    builder: (_, allSelected) {
                      return CustomColorIconButton(
                        onPressed: () => BlocProvider.of<WeekPageBloc>(_).add(WeekPageEventSelectAll()),
                        iconData: allSelected ? FluentIcons.select_all_off_20_regular : FluentIcons.select_all_on_20_regular,
                        background: MyColors.dark_4,
                        boxShadow: const BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0,
                          blurRadius: 2,
                        ),
                      );
                    }),
              ],
            );
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomColorIconButton(
                onPressed: () => {},
                iconData: FluentIcons.settings_24_regular,
                background: MyColors.dark_4,
                boxShadow: const BoxShadow(
                  color: Colors.black,
                  spreadRadius: 0,
                  blurRadius: 2,
                ),
              ),
              BlocSelector<WeekPageBloc, WeekPageState, int>(
                key: GlobalKey(),
                selector: (state4) => state4.weekNumber,
                builder: (_, wNumber) {
                  int weekNumber = TimeService.instance.currentWeek;
                  return Stack(
                    fit: StackFit.loose,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: MyColors.dark_1,
                            boxShadow: wNumber == weekNumber
                                ? [const BoxShadow(color: Colors.white, spreadRadius: 1.5, blurRadius: 0)]
                                : []),
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: Row(
                          children: [
                            const Icon(
                              FluentIcons.chevron_left_16_filled,
                              size: 28,
                            ),
                            Stack(
                              children: [
                                SizedBox(
                                  width: 160,
                                  child: Text(
                                    "$wNumber неделя (${wNumber % 2 == 0 ? "четная" : "нечетная"})",
                                    style: Theme.of(_).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                            const Icon(
                              FluentIcons.chevron_right_16_filled,
                              size: 28,
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                  onTap: () => BlocProvider.of<WeekPageBloc>(_, listen: false).add(GetSchedule(
                                      weekNumber: BlocProvider.of<WeekPageBloc>(_, listen: false).state.weekNumber - 1))),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => BlocProvider.of<WeekPageBloc>(_, listen: false).add(GetSchedule(
                                    weekNumber: BlocProvider.of<WeekPageBloc>(_, listen: false).state.weekNumber + 1)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              CustomColorIconButton(
                onPressed: () => {showCalendar(context)},
                iconData: FluentIcons.calendar_48_regular,
                background: MyColors.dark_4,
                boxShadow: const BoxShadow(
                  color: Colors.black,
                  spreadRadius: 0,
                  blurRadius: 2,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _scrollEvent(BuildContext context) {
    BlocProvider.of<RightMenuBloc>(context).add(RightMenuEventMoveTo(day: -1));
  }

  Widget _buildBody(BuildContext context) {
    return BlocSelector<WeekPageBloc, WeekPageState, WeekPageStateStatus>(
      selector: (state) => state.status,
      builder: (_, status) {
        if (status == WeekPageStateStatus.initial) {
          return const Center(child: Text("Пусто"));
        } else if (status == WeekPageStateStatus.loading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (status == WeekPageStateStatus.success || status == WeekPageStateStatus.editMode) {
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        if (scrollNotification is ScrollStartNotification) {
                          BlocProvider.of<WeekPageBloc>(context).state.schedule.forEach((element) {
                            for (var element in element.state.lessons) {
                              element.add(LessonEventStartScroll());
                            }
                          });
                          _scrollEvent(context);
                        }
                        return true;
                      },
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Container(
                          padding: const EdgeInsets.only(right: 72),
                          child: Column(
                            children: _buildDays(context, BlocProvider.of<WeekPageBloc>(context).state),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const ModesPageViewModeBottomBar(),
                ],
              ),
              Positioned(
                right: 0,
                child: RightMenu(
                  bloc: BlocProvider.of<RightMenuBloc>(context),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: Text("ff"));
        }
      },
    );
  }

  List<Widget> _buildDays(BuildContext context, WeekPageState state) {
    List<GlobalKey> daysKeys = [];
    List<Weekday> days = [];
    List<Widget> daysList = [];
    for (var i = 0; i < state.schedule.length; i++) {
      GlobalKey key = GlobalKey();
      daysKeys.add(key);
      days.add(state.schedule[i].day.day);
      daysList.add(
        DayWidget(
          day: state.schedule[i],
          key: key,
        ),
      );
    }
    BlocProvider.of<RightMenuBloc>(context).add(
      RightMenuEventInitialize(
        daysKeys: daysKeys,
        weekNumber: state.weekNumber,
        days: days,
      ),
    );
    return daysList;
  }
}
