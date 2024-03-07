import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduleapp/core/constants/my_colors.dart';
import 'package:scheduleapp/core/utils/time/time_service.dart';
import 'package:scheduleapp/presenter/bloc/lesson/lesson_bloc.dart';
import 'package:scheduleapp/presenter/bloc/lesson/lesson_event.dart';
import 'package:scheduleapp/presenter/bloc/lesson/lesson_state.dart';
import 'package:scheduleapp/presenter/bloc/week/week_bloc.dart';
import 'package:scheduleapp/presenter/bloc/week/week_event.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/routing/routing.dart';
import 'lesson_info.dart';

class LessonWidget extends StatefulWidget {
  const LessonWidget({super.key, required this.lesson, required this.top, required this.bottom});
  final bool bottom;
  final bool top;
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
                  _showMyDialog(context, state);
                } else {
                  lesson.add(LessonEventPressUp());
                  BlocProvider.of<WeekPageBloc>(context)
                      .add(WeekPageEventSelectLesson(state.lesson.id, state.lesson.date.day, !state.selected));
                }
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
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                transformAlignment: Alignment.centerLeft,
                transform: state.isPressed
                    ? Matrix4(0.96, 0, 0, 0, 0, 0.96, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
                    : Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
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

  Future<void> _showMyDialog(BuildContext context, LessonState state) async {
    bool pressed = false;
    return showDialog<void>(
      context: context,

      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          alignment: Alignment.center,
          contentPadding: const EdgeInsets.only(bottom: 0, top: 0),
          titlePadding: const EdgeInsets.only(top: 0),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(foregroundColor: Color(0xff00ffaa)),
                  onPressed: () {
                    TimeService _service = TimeService.instance;
                    int week = BlocProvider.of<WeekPageBloc>(context).state.weekNumber;
                    String month = _service.getWeekName(week);
                    int day = _service.getMonthDay(week, lesson.state.lesson.date.day);

                    Share.share(
                        "🗓${state.lesson.date.day.fullName}, $day $month. \n📘${state.lesson.subject}\n🥷${state.lesson.teacher} \n🏫${state.lesson.classroom} \n🕐${state.lesson.time.start}-${state.lesson.time.end}");

                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 48,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(FluentIcons.share_android_24_regular, size: 28, color: Colors.white),
                        SizedBox(
                          width: 16,
                        ),
                        Text("Поделиться", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(foregroundColor: Color(0xff00ffaa)),
                  onPressed: () {
                    Navigator.of(context).pop();
                    AutoRouter.of(context).push(EditLessonRoute(lesson: lesson.state.lesson));
                  },
                  child: Container(
                    height: 48,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(FluentIcons.text_bullet_list_square_edit_24_regular, size: 28, color: Colors.white),
                        SizedBox(
                          width: 16,
                        ),
                        Text("Изменить", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white24,
                  thickness: 1,
                  height: 1,
                ),
                TextButton(
                  style: TextButton.styleFrom(foregroundColor: Color(0xff00ffaa)),
                  onPressed: () {
                    pressed = true;
                    BlocProvider.of<WeekPageBloc>(context).add(SetEditMode());

                    BlocProvider.of<WeekPageBloc>(context)
                        .add(WeekPageEventSelectLesson(state.lesson.id, state.lesson.date.day, !state.selected));
                    Navigator.of(context).pop();
                    lesson.add(LessonEventPressUp());
                  },
                  child: Container(
                    height: 48,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(FluentIcons.shortpick_24_regular, size: 28, color: Colors.white),
                        SizedBox(
                          width: 16,
                        ),
                        Text("Отображение", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).then((_) => {if (!pressed) lesson.add(LessonEventPressCancel())});
  }
}
