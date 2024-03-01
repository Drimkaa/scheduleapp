import 'package:auto_route/auto_route.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:scheduleapp/core/routing/routing.dart';
import 'package:scheduleapp/data/entities/lesson_entity.dart';
import 'package:scheduleapp/presenter/bloc/edit/edit_bloc.dart';
import 'package:scheduleapp/presenter/bloc/edit/edit_event.dart';
import 'package:scheduleapp/presenter/bloc/week/week_bloc.dart';
import 'package:scheduleapp/presenter/bloc/week/week_event.dart';
import 'package:scheduleapp/presenter/bloc/week/week_state.dart';

import '../../core/constants/my_colors.dart';
import '../bloc/edit/edit_state.dart';

class ModesPageViewModeBottomBar extends StatelessWidget {
  const ModesPageViewModeBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<WeekPageBloc, WeekPageState, bool>(
      selector: (state) => state.editMode,
      builder: (context, state) {
        return Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: state ? 60 : 0,
              color: const MyColors().dark_3,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              left: 0,
              height: 60,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: EdgeInsets.only(top: state ? 0 : 60),
                color: const MyColors().dark_3,
                child: BlocSelector<WeekPageBloc, WeekPageState, int>(
                  selector: (state2) => state2.selectedCount,
                  builder: (context, state2) {
                    Color color = state2 > 0 ? Colors.white : Colors.white24;
                    return SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 90,
                              child: GestureDetector(
                                onTap: () => {
                                  if (state2 > 0) {BlocProvider.of<WeekPageBloc>(context).add(WeekPageEventHide())}
                                },
                                child: BlocSelector<WeekPageBloc, WeekPageState, bool>(
                                  selector: (state3) => state3.allIsHidden,
                                  builder: (context, state3) {
                                    if (state3) {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(FluentIcons.border_all_20_regular, size: 28, color: color),
                                          Text("Показать", style: TextStyle(color: color)),
                                        ],
                                      );
                                    }
                                    if(state2 == 0) {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(FluentIcons.border_none_20_regular, size: 28, color: color),
                                          Text("Ничего", style: TextStyle(color: color)),
                                        ],
                                      );
                                    }
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(FluentIcons.border_none_20_regular, size: 28, color: color),
                                        Text("Скрыть", style: TextStyle(color: color)),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 32,
                            ),
                            GestureDetector(
                              onTap: () => {if (state2 == 1) {AutoRouter.of(context).push( EditLessonRoute(lesson: BlocProvider.of<WeekPageBloc>(context).state.getSelectedLesson()??Lesson()))                  }},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(FluentIcons.edit_20_regular, size: 28, color: state2 == 1 ? Colors.white : Colors.white24),
                                  Text(
                                    "Изменить",
                                    style: TextStyle(color: state2 == 1 ? Colors.white : Colors.white24),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
