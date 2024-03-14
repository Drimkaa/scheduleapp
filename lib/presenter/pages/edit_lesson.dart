import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scheduleapp/core/constants/constants.dart';
import 'package:scheduleapp/data/entities/lesson_entity.dart';

import '../widgets/input/text_input.dart';

@RoutePage()
class EditLessonScreen extends StatelessWidget {
  const EditLessonScreen({super.key, required this.lesson});

  final  Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar( leading: AutoLeadingButton(),   ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        Row(children: [
          Text("Название: ${lesson.subject}"),
          TextInputWithPopupSuggestions(),
        ]),

        Text("Тип: ${lesson.subjectType.fullName}"),
        Text("Время: ${lesson.time.start} ${lesson.time.end} ${lesson.time.label}"),
        Text("Формат: ${lesson.lessonType.fullName}"),
        Text("Преподаватель: ${lesson.teacher}"),
        Text("Подгруппа: ${lesson.subgroup}"),
        Text("День: ${lesson.date.day.fullName}"),
        Text("Аудитория: ${lesson.classroom}"),
          Row(children: [
            Text("Название: ${lesson.subject}"),
            TextInputWithPopupSuggestions(),
          ]),
      ],),
    );
    Text("редактор");
  }
}
