import 'package:flutter/material.dart';
import 'package:scheduleapp/core/constants/constants.dart';
import 'package:scheduleapp/core/constants/my_colors.dart';
import 'package:scheduleapp/data/entities/lesson_entity.dart';

class LessonInfoWidget extends StatelessWidget {
  const LessonInfoWidget({super.key, required this.lesson, required this.top, required this.bottom});
  final bool bottom;
  final bool top;
  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MyColors.dark_2,
          borderRadius:
              BorderRadius.only(topRight: Radius.circular(top ? 16 : 0), bottomRight: Radius.circular(bottom ? 16 : 0))),
      padding: const EdgeInsets.only(left: 22, top: 0, right: 0, bottom: 0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            SizedBox(
              width: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(lesson.time.start, style: Theme.of(context).textTheme.bodyLarge),
                  if(lesson.lessonType==LessonType.person)
                  Text(lesson.classroom,
                      textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: MyColors.first)),
                  if(lesson.lessonType == LessonType.remote)
                    Text("Дистант",
                        textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: MyColors.first)),
                  Text(lesson.time.end, style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              fit: FlexFit.tight,
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: MyColors.dark_4,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    child: Text(
                      lesson.subjectType.shortName.toUpperCase(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(color: MyColors.second),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(lesson.subject, softWrap: true, style: Theme.of(context).textTheme.labelLarge),
                  if (lesson.teacher != " ") const SizedBox(height: 8),
                  if (lesson.teacher != " ")
                    Text("${lesson.teacher} ",
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: const Color(0xff7b7b7b))),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
