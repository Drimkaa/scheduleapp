import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:scheduleapp/core/constants/constants.dart';
import 'package:scheduleapp/data/entities/lesson_entity.dart';

import '../widgets/input/text_input.dart';

@RoutePage()
class EditLessonScreen extends StatelessWidget {
  const EditLessonScreen({super.key, required this.lesson});

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AutoLeadingButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Название: ${lesson.subject}"),
            SizedBox(
              width: 200,
              height: 70,

              child: TextInputWithPopupSuggestions(),
            ),
            Text("Тип: ${lesson.subjectType.fullName}"),
            Text("Время: ${lesson.time.start} ${lesson.time.end} ${lesson.time.label}"),
            Text("Формат: ${lesson.lessonType.fullName}"),
            Text("Преподаватель: ${lesson.teacher}"),
            Text("Подгруппа: ${lesson.subgroup}"),
            Text("День: ${lesson.date.day.fullName}"),
            Text("Аудитория: ${lesson.classroom}"),
            Text("Название: ${lesson.subject}"),
            SizedBox(
              width: 200,
              height: 60,
              child: TypeAheadField<String>(
                suggestionsCallback: (search) => ["gg", 'gg2'],
                builder: (context, controller, focusNode) {
                  return TextField(
                      controller: controller,
                      focusNode: focusNode,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'City',
                      ));
                },
                itemBuilder: (context, city) {
                  return ListTile(
                    title: Text(city),
                  );
                },
                onSelected: (city) {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  _print(String value) {
    print(value);
  }
}
