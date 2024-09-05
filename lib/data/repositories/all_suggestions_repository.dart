
import 'package:scheduleapp/data/source/mapper/hive_to_entity.dart';

import '../entities/lesson_time_entity.dart';
import '../source/postgres/postgres_source.dart';

import '../source/local/hive_source.dart';

class LessonSuggestions {
  //final PostgresDataSource _wire;
  final LocalDataSource  _local;
  LessonSuggestions( {required PostgresDataSource postgresDataSource,
    required LocalDataSource localDataSource
  }) : /*_wire = postgresDataSource,*/  _local = localDataSource {
    _local.getAllLessons()
        .then((e) {for (var element in e) {
      _subjects.contains(element.subject) ? null : _subjects.add(element.subject);
      _teachers.contains(element.teacher) ? null : _teachers.add(element.teacher);
      _classrooms.contains(element.classroom) ? null : _classrooms.add(element.classroom);
      LessonTime model = element.time.toEntity();
      _time.contains(model) ? null : _time.add(model);
    }});
  }
  late final List<String> _subjects;
  late final List<String> _teachers;
  late final List<String> _classrooms;
  late final List<LessonTime> _time;


}