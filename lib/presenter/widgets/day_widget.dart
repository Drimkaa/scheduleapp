import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduleapp/core/constants/constants.dart';
import 'package:scheduleapp/presenter/bloc/day/day_bloc.dart';
import 'package:scheduleapp/presenter/bloc/day/day_event.dart';
import 'package:scheduleapp/presenter/bloc/day/day_state.dart';
import 'package:scheduleapp/presenter/widgets/lesson_widget.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({super.key, required this.day});

  final DayBloc day;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayBloc, DayState>(
      bloc: day,
      builder: (context, state) {
        if (state.status == DateStateStatus.initial) {
          return _buildInitialUI(context, state);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildInitialUI(BuildContext context, DayState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 22, bottom: 10, top: 4),
              child: Text(state.day.fullName, textAlign: TextAlign.left, style: Theme.of(context).textTheme.titleLarge),
            ),
            if (state.hiddenLessons > 0) _buildHiddenLessonsButton(context, state),
          ],
        ),
        ..._buildLessonWidgets(context, state),
      ],
    );
  }

  Widget _buildHiddenLessonsButton(BuildContext context, DayState state) {
    return GestureDetector(
      onTap: () => day.add(DayEventShowButton()),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("скрыто ${state.hiddenLessons}",
              textAlign: TextAlign.left, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white70)),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.rotationX(state.displayHiddenLessons ? pi : 0),
            transformAlignment: Alignment.center,
            child: const Icon(Icons.keyboard_arrow_down),
          )
        ],
      ),
    );
  }

  List<Widget> _buildLessonWidgets(BuildContext context, DayState state) {
    final lessonWidgets = <Widget>[];
    int visibleLessonCount = 0;

    for (var i = 0; i < state.lessons.length; i++) {
      final lesson = state.lessons[i];
      if (!(lesson.state.hidden && !state.displayHiddenLessons)) {
        GlobalKey key = GlobalKey();
        lessonWidgets.add(LessonWidget(
          lesson: lesson,
          key: key,
          key2:key,
          top: visibleLessonCount == 0,
          bottom: (!state.displayHiddenLessons && visibleLessonCount == state.lessons.length - state.hiddenLessons - 1) ||
              (state.displayHiddenLessons && i == state.lessons.length - 1),
        ));
        visibleLessonCount++;

        if (i != state.lessons.lastIndexWhere((el) => !el.state.hidden) || state.displayHiddenLessons) {
          lessonWidgets.add(const SizedBox(height: 16));
        }
      }
    }
    return lessonWidgets;
  }
}
