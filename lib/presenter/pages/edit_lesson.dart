import 'package:auto_route/auto_route.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:scheduleapp/core/constants/constants.dart';
import 'package:scheduleapp/data/entities/lesson_entity.dart';
import 'package:scheduleapp/data/repositories/postgres_repository.dart';

import '../../core/constants/my_colors.dart';
import '../../injection_container.dart';
import '../widgets/icon_button.dart';
import '../widgets/input/dropdown.dart';
import '../widgets/input/text_input.dart';
import '../widgets/input/time_input.dart';

@RoutePage()
class EditLessonScreen extends StatelessWidget {
   const EditLessonScreen({super.key, required this.lesson});

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
      extendBody: false,
      appBar: AppBar(

        automaticallyImplyLeading: false,

        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CustomColorIconButton(

            onPressed: () {
              AutoRouter.of(context).back();
            },
            iconData: FluentIcons.arrow_left_16_regular,
            background: MyColors.dark_1,
          ),
           Text('занятие: ${lesson.id}'),
          CustomColorIconButton(

            onPressed: () {
              Navigator.pop(context, lesson);
            },
            iconData: FluentIcons.markdown_20_filled,
            background: MyColors.dark_1,
          ),
        ]),
      ),
      body: SingleChildScrollView(
          child:Padding(
            padding: const EdgeInsets.all(22.0),
            child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(
                  height: 16,
                ),
                const Text("Название"),
                SizedBox(
                  height: 44,
                  child: TextInputWithPopupSuggestions(repository: sl<GetLessonSuggestions>(), value: lesson.subject),
                )
              ]),

            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 16,
              ),
              const Text("Преподаватель"),
              SizedBox(
                height: 44,
                child: TextInputWithPopupSuggestions(repository: sl<GetTeacherSuggestions>(), value: lesson.teacher),
              )
            ]),
              Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(
                  height: 16,
                ),
                const Text("Аудитория"),
                SizedBox(
                  height: 44,
                  child: TextInputWithPopupSuggestions(repository: sl<GetClassroomSuggestions>(), value: lesson.classroom),
                )
              ]),
              Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(
                  height: 16,
                ),
                const Text("Тип"),
                SizedBox(
                  height: 44,
                  child: DropdownList(items: SubjectType.values.map((e) => e.fullName).toList(),hintText: "тип", value: lesson.subjectType.fullName,),
                )
              ]),
              const SizedBox(
                height: 16,
              ),
              //Text("Время: ${lesson.time.start} ${lesson.time.end} ${lesson.time.label}"),
              TimeInput(lessonTime: lesson.time),
              Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(
                  height: 16,
                ),
                const Text("Формат занятия"),
                SizedBox(
                  height: 44,
                  child: DropdownList(items: LessonType.values.map((e) => e.fullName).toList(),hintText: "тип", value: lesson.lessonType.fullName,),
                )
              ]),

              Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(
                  height: 16,
                ),
                const Text("Подгруппа"),
                SizedBox(
                  height: 44,
                  child: DropdownList(items: const ["0","1","2","3","4"],hintText: "тип", value: lesson.subgroup.toString(),),
                )
              ]),
              Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(
                  height: 16,
                ),
                const Text("День"),
                SizedBox(
                  height: 44,
                  child: DropdownList(items: Weekday.values.map((e) => e.fullName).toList(),hintText: "тип", value: lesson.date.day.fullName,),
                )
              ]),

          ],
          ),
        ),
      ),
    );
  }

}
