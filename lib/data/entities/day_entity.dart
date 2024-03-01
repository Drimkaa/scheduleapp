import 'package:scheduleapp/core/constants/constants.dart';

import 'lesson_entity.dart';

class Day {
  Weekday day;
  List<Lesson> lessons;
  Day(this.day,this.lessons);

}