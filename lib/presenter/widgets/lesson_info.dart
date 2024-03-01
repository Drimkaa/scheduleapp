import 'package:flutter/material.dart';
import 'package:scheduleapp/core/constants/constants.dart';
import 'package:scheduleapp/core/constants/my_colors.dart';
import 'package:scheduleapp/data/entities/lesson_entity.dart';

class LessonInfoWidget extends StatelessWidget {
  const LessonInfoWidget({super.key, required this.lesson});

  final  Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 74,
      padding: EdgeInsets.only(left: 22, top: 0, right: 0, bottom: 0),
      color: const MyColors().dark_2,
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
                  Text(lesson.classroom,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: const MyColors().first)),
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
                    decoration: BoxDecoration(
                      color: const MyColors().dark_4,
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    child: Text(
                      lesson.subjectType.shortName.toUpperCase(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(color: const MyColors().second),
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
