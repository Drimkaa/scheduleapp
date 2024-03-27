import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduleapp/core/constants/my_colors.dart';
import 'package:scheduleapp/presenter/bloc/lesson/lesson_bloc.dart';
import 'package:scheduleapp/presenter/bloc/week/week_bloc.dart';
import 'package:scheduleapp/presenter/pages/lesson_page.dart';

import '../bloc/lesson/lesson_event.dart';
import '../bloc/lesson/lesson_state.dart';
import 'lesson_info.dart';

class LessonWidget extends StatefulWidget {
  const LessonWidget({super.key, required this.lesson, required this.top, required this.bottom, required this.key2});
  final bool bottom;
  final bool top;
  final LessonBloc lesson;
  final GlobalKey key2;

  @override
  State<StatefulWidget> createState() => _LessonWidget();
}

class _LessonWidget extends State<LessonWidget> {
  late LessonBloc lesson;

  @override
  void initState() {
    super.initState();
    lesson = widget.lesson;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBloc, LessonState>(
        bloc: lesson,
        builder: (context, state) {
          if (state.status == LessonStateStatus.initial) {
            return GestureDetector(
              onLongPressUp: () async {
                if (!state.editMode) {
                  BlocProvider.of<WeekPageBloc>(context).add(SetEditMode());
                }
                lesson.add(LessonEventPressUp());
                BlocProvider.of<WeekPageBloc>(context)
                    .add(WeekPageEventSelectLesson(state.lesson.id, state.lesson.date.day, !state.selected));
              },
              onLongPressDown: (e) {
                lesson.add(LessonEventPressDown());
              },
              onLongPressCancel: () {
                lesson.add(LessonEventPressCancel());
                if (state.editMode) {
                  BlocProvider.of<WeekPageBloc>(context)
                      .add(WeekPageEventSelectLesson(state.lesson.id, state.lesson.date.day, !state.selected));
                }
              },
              onTap: () {
                if (!state.editMode) {
                  // _showMyDialog(context, state);
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true, // set this to true
                      builder: (context) {
                        return LessonScreen(lesson: lesson);
                      });
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                transformAlignment: Alignment.centerLeft,
                transform: state.isPressed ? Matrix4(0.96, 0, 0, 0, 0, 0.96, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1) : Matrix4.identity(),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: state.hidden ? 0.3 : 1,
                      child: LessonInfoWidget(lesson: state.lesson, top: widget.top, bottom: widget.bottom),
                    ),
                    if (state.editMode)
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(50, 255, 255, 255),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(widget.top ? 16 : 0),
                                  bottomRight: Radius.circular(widget.bottom ? 16 : 0))),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              transform: state.isPressed
                                  ? Matrix4(0.8, 0, 0, 0, 0, 0.8, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
                                  : Matrix4.identity(),
                              transformAlignment: Alignment.center,
                              margin: const EdgeInsets.only(right: 8, bottom: 8),
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: state.selected ? MyColors.sixth : MyColors.dark_4,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: state.selected ? const Icon(FluentIcons.checkmark_12_regular, size: 14) : const SizedBox(),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }

          return const Text("загрузка");
        });
  }
}
