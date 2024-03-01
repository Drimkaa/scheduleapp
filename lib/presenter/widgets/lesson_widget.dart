import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduleapp/core/constants/constants.dart';
import 'package:scheduleapp/core/constants/my_colors.dart';
import 'package:scheduleapp/data/entities/lesson_entity.dart';
import 'package:scheduleapp/presenter/bloc/edit/edit_event.dart';
import 'package:scheduleapp/presenter/bloc/lesson/lesson_bloc.dart';
import 'package:scheduleapp/presenter/bloc/lesson/lesson_event.dart';
import 'package:scheduleapp/presenter/bloc/lesson/lesson_state.dart';
import 'package:scheduleapp/presenter/bloc/week/week_bloc.dart';
import 'package:scheduleapp/presenter/bloc/week/week_event.dart';

import '../bloc/edit/edit_bloc.dart';
import 'lesson_info.dart';

class LessonWidget extends StatefulWidget {
  const LessonWidget({Key? key, required this.lesson}) : super(key: key);

  final LessonBloc lesson;

  @override
  State<StatefulWidget> createState() => _LessonWidget();
}

class _LessonWidget extends State<LessonWidget> {
  late LessonBloc lesson;

  @override
  void initState() {

    super.initState();
    lesson = widget.lesson;

    print("REBUILD lesson ${lesson.state.lesson.id}");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBloc, LessonState>(
        bloc: lesson,
        builder: (context, state) {

          if (state.status == LessonStateStatus.initial) {
            return GestureDetector(
              onLongPress: () {

              },
              onLongPressUp: () async {
                lesson.add(LessonEventPressUp());
                BlocProvider.of<WeekPageBloc>(context)
                    .add(WeekPageEventSelectLesson(state.lesson.id, state.lesson.date.day, !state.selected));
                if(!lesson.state.editMode)
                    BlocProvider.of<WeekPageBloc>(context).add(SetEditMode());


                /*lesson.isPressed = false;
                if (state.editMode) {
                  if (state.selected) {
                    lesson.add(LessonEventUnselect());
                    BlocProvider.of<WeekPageBloc>(context).add(WeekPageEventSelectLesson(state.lesson.id, state.lesson.date.day, !state.selected));

                  } else {
                    lesson.add(LessonEventSelect());
                    BlocProvider.of<WeekPageBloc>(context).add(WeekPageEventSelectLesson(state.lesson.id, state.lesson.date.day, !state.selected));

                  }
                } else {
                  lesson.add(LessonEventSelect());

                  Timer(Duration(milliseconds: 100),() {
                    BlocProvider.of<WeekPageBloc>(context).add(SetEditMode());
                    BlocProvider.of<WeekPageBloc>(context).add(WeekPageEventSelectLesson(state.lesson.id, state.lesson.date.day, !state.selected));

                  });

                }*/


              },
              onLongPressDown: (e) {
                lesson.add(LessonEventPressDown());
                /*setState(() {
                  lesson.isPressed = true;
                });*/

              },
              onLongPressCancel: () {
                lesson.add(LessonEventPressCancel());
                BlocProvider.of<WeekPageBloc>(context)
                    .add(WeekPageEventSelectLesson(state.lesson.id, state.lesson.date.day, !state.selected));
                /*if (state.editMode) {
                  lesson.isPressed = false;
                  if (state.selected) {
                    lesson.add(LessonEventUnselect());
                    BlocProvider.of<WeekPageBloc>(context).add(WeekPageEventSelectLesson(state.lesson.id, state.lesson.date.day, !state.selected));

                  } else {
                    lesson.add(LessonEventSelect());
                    BlocProvider.of<WeekPageBloc>(context).add(WeekPageEventSelectLesson(state.lesson.id, state.lesson.date.day, !state.selected));

                  }
                } else {
                  setState(() {
                    lesson.isPressed = false;
                  });
                }*/

              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                transform: state.isPressed
                    ? Matrix4(0.96, 0, 0, 0, 0, 0.96, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
                    : Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
                child: Stack(
                  children: [
                    Opacity(opacity: state.hidden? 0.3:1,child:
                    LessonInfoWidget(lesson: state.lesson),),

                    if (state.editMode)
                      Positioned.fill(
                        child: Container(
                          color: const Color.fromARGB(50, 255, 255, 255),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              transform: state.isPressed
                                  ? Matrix4(0.8, 0, 0, 0, 0, 0.8, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
                                  : Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
                              transformAlignment: Alignment.center,
                              margin: const EdgeInsets.only(right: 8, bottom: 8),
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: state.selected ? const MyColors().sixth : const MyColors().dark_4,
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

  Widget _buildCurrentLessonIndicator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ],
    );
  }
}
