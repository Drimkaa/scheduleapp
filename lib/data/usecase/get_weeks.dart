import 'package:scheduleapp/core/constants/constants.dart';
import 'package:scheduleapp/core/utils/time/time_service.dart';
import 'package:scheduleapp/data/entities/day_entity.dart';
import 'package:scheduleapp/data/entities/lesson_time_entity.dart';
import 'package:scheduleapp/data/entities/week_entity.dart';
import 'package:scheduleapp/data/repositories/group_repository.dart';
import 'package:scheduleapp/data/repositories/lesson_repository.dart';

import '../entities/group/group_entity.dart';
import '../entities/lesson_entity.dart';

class GetWeekDaysSchedule {

  final LessonRepository _lessonRepository;
  final GroupRepository _groupRepository;

  const GetWeekDaysSchedule({
    required LessonRepository lessonRepository,
    required GroupRepository groupRepository,
  })  :
        _lessonRepository = lessonRepository,
  _groupRepository = groupRepository;
  Future<List> getWeekDays({required int number}) async {
    if(number==-1){
      TimeService _serv = TimeService.instance;
      number = _serv.currentWeek;
    }

     Group group = await _groupRepository.getGroup();
     List<Lesson> lessons = await _lessonRepository.getAllLessons();
     Map<int,Day> scheduleOfWeek = {};
     for(var lesson in lessons){
       if(lesson.subgroup!=0 && lesson.subgroup != group.subgroup || !lesson.date.type.getWeeks().contains(number)) continue;
       Weekday day = lesson.date.day;
       if(!scheduleOfWeek.containsKey(day.pos)){
         scheduleOfWeek[day.pos] = Day(day, [lesson]);
       } else {
         scheduleOfWeek[day.pos]!.lessons.add(lesson);
       }
     }
    scheduleOfWeek.forEach((key, value) {
      value.lessons.sort((a,b)=>a.time.startInt.compareTo(b.time.startInt));
    });

     return [scheduleOfWeek.values.toList()..sort((a,b)=>a.day.pos.compareTo(b.day.pos)),number];
  }
}