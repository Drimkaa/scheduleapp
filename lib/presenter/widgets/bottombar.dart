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
  const ModesPageViewModeBottomBar({super.key, }) ;

  @override
  Widget build(BuildContext context) {
    const double height = 70;

    return BlocSelector<WeekPageBloc, WeekPageState, bool>(
      selector: (state) => state.editMode,
      builder: (context, state) {
        return Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: state ? height : 0,
              color: MyColors.dark_3,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              left: 0,
              height: height,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: EdgeInsets.only(top: state ? 0 : height),
                color: MyColors.dark_3,
                child: BlocSelector<WeekPageBloc, WeekPageState, int>(
                  selector: (state2) => state2.selectedCount,
                  builder: (context, state2) {
                    final Color color = state2 > 0 ? Colors.white : Colors.white24;
                    return SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: SizedBox(
                        height: height,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 120,
                              child: TextButton(
                                style: TextButton.styleFrom(foregroundColor: Colors.transparent),
                                onPressed: () {
                                  if (state2 > 0) {
                                    BlocProvider.of<WeekPageBloc>(context).add(WeekPageEventHide());
                                  }
                                },
                                child: BlocSelector<WeekPageBloc, WeekPageState, bool>(
                                  selector: (state3) => state3.allIsHidden,
                                  builder: (context, state3) {
                                    if (state3) {
                                      return _buildButtonColumn(FluentIcons.border_all_20_regular, "Показать", color);
                                    }
                                    if (state2 == 0) {
                                      return _buildButtonColumn(FluentIcons.border_none_20_regular, "Ничего", color);
                                    }
                                    return _buildButtonColumn(FluentIcons.border_none_20_regular, "Скрыть", color);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: TextButton(
                                style: TextButton.styleFrom(foregroundColor: Colors.transparent),
                                onPressed: () {
                                  if (state2 == 1) {
                                    AutoRouter.of(context).push(EditLessonRoute(
                                      lesson: BlocProvider.of<WeekPageBloc>(context).state.getSelectedLesson(),
                                    ));
                                  }
                                },
                                child: _buildButtonColumn(FluentIcons.edit_20_regular, "Изменить", state2 == 1 ? Colors.white : Colors.white24),
                              ),
                            ),
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

  Widget _buildButtonColumn(IconData iconData, String label, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(iconData, size: 28, color: color),
        Text(
          label,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
