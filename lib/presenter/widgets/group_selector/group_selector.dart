import 'package:flutter/material.dart';
import 'package:scheduleapp/core/constants/app_themes.dart';
import 'package:scheduleapp/data/entities/lesson_entity.dart';
import 'package:scheduleapp/data/repositories/group_repository.dart';
import 'package:scheduleapp/data/repositories/lesson_repository.default.dart';
import 'package:scheduleapp/injection_container.dart';

import '../../../core/constants/my_colors.dart';

class GroupSelectorWidget extends StatefulWidget {
  const GroupSelectorWidget({super.key});

  @override
  State<StatefulWidget> createState() => _GroupSelectorWidget();
}

class _GroupSelectorWidget extends State<GroupSelectorWidget> {
  final List<int> subgroups = [];
  late  int currentSubgroup = 0;
  getSubgroups() async {
    List<Lesson> lessons = await sl<LessonRepositoryImpl>().getAllLessons();
    for (var lesson in lessons) {

      if (!subgroups.contains(lesson.subgroup) && lesson.subgroup!=0) {
        subgroups.add(lesson.subgroup);
      }
    }
    setState(() {

    });
  }
  getCurrentSubgroup() async {
    currentSubgroup = (await sl<GroupRepository>().getGroup()).subgroup;

  }
  @override
  void initState() {
    super.initState();
    getSubgroups();
    getCurrentSubgroup();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Container(

      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: MyColors.dark_3,
        borderRadius: BorderRadius.circular(22),
      ),
      child:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text("Подгруппа", style: Theme.of(context).textTheme.bodySmallWith()),
          const SizedBox(
            width: 22,
          ),
          Row(
            children: [
              for (var i = 0; i < subgroups.length; i++) ...[


                _buildButtonContainer(subgroups[i]),
                if (i < subgroups.length - 1) // Добавляем SizedBox, только если это не последний элемент
                  const SizedBox(
                    width: 20,
                  ),
              ],
            ],
          )

        ]),
      ),
      ],
    );
  }
  Widget _buildButtonContainer(int text) {
    return
      GestureDetector(
        onTap: () async {
          // Выполняем асинхронные действия поочередно, дожидаясь их завершения
          await sl<GroupRepository>().setSubgroup(text);
          await getCurrentSubgroup(); // Ждем завершения getCurrentSubgroup()

          // Обновляем состояние после выполнения всех асинхронных функций
          setState(() {});
        },
        child:  Container(
          width: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: text == currentSubgroup ? MyColors.first : MyColors.dark_1,
            borderRadius: BorderRadius.circular(22),
          ),
          child:
          Text(
            textAlign: TextAlign.center,
            "$text",
            style: Theme.of(context).textTheme.bodySmallWith(
              color:  text == currentSubgroup ? MyColors.dark_3 : Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),

          ),

      )
     ;
  }
}
