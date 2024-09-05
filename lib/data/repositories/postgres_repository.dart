
import 'package:scheduleapp/core/constants/lessons.dart';
import 'package:scheduleapp/data/source/postgres/postgres_source.dart';

import '../source/local/hive_source.dart';

abstract class GetSuggestionsRepository {
  const GetSuggestionsRepository();

  Future<List<String>> call(String word, {offset});
}

class GetHEISuggestions extends GetSuggestionsRepository {
  final PostgresDataSource _source;

  const GetHEISuggestions({
    required PostgresDataSource source,
  }) : _source = source;

  @override
  Future<List<String>> call(String word, {offset}) async {
    final suggestions = await _source.getHEISuggestions(word, offset: offset);
    return suggestions;
  }
}

class GetLessonSuggestions extends GetSuggestionsRepository {
  final LocalDataSource _source;
  late final  List<String> _subjects = [];
  GetLessonSuggestions({
    required LocalDataSource source,
  }) : _source = source;
   initialize() {
     _source.getAllLessons()
        .then((e) {
      for (var f in e) {
        _subjects.contains(f.subject) ? null : _subjects.add(f.subject);
      }

      for (var f in subjects) {
        _subjects.contains(f) ? null : _subjects.add(f);
      }
      print(_subjects);
    });
  }
  @override
  Future<List<String>> call(String word, {offset}) async {
    if (_subjects.isEmpty) {
      await initialize();
    }
    final suggestions = _subjects.map((e) => e.toLowerCase().contains(word.toLowerCase()) ? e : "").toList();
    suggestions.removeWhere((element) => element == "");
    return suggestions;
  }
}

class GetTeacherSuggestions extends GetSuggestionsRepository {
  final LocalDataSource _source;
  late final  List<String> _data = [];
  GetTeacherSuggestions({
    required LocalDataSource source,
  }) : _source = source;
  initialize() {
    _source.getAllLessons()
        .then((e) {
      for (var f in e) {
        _data.contains(f.teacher) ? null : _data.add(f.teacher);
      }
    });
  }
  @override
  Future<List<String>> call(String word, {offset}) async {
    if (_data.isEmpty) {
      await initialize();
    }
    final suggestions = _data.map((e) => e.toLowerCase().contains(word.toLowerCase()) ? e : "").toList();
    suggestions.removeWhere((element) => element == "");
    return suggestions;
  }
}

class GetClassroomSuggestions extends GetSuggestionsRepository {
  final LocalDataSource _source;
  late final  List<String> _data = [];
  GetClassroomSuggestions({
    required LocalDataSource source,
  }) : _source = source;
  initialize() {
    _source.getAllLessons()
        .then((e) {
      for (var f in e) {
        _data.contains(f.classroom) ? null : _data.add(f.classroom);
      }
    });
  }
  @override
  Future<List<String>> call(String word, {offset}) async {
    if (_data.isEmpty) {
      await initialize();
    }
    final suggestions = _data.map((e) => e.toLowerCase().contains(word.toLowerCase()) ? e : "").toList();
    suggestions.removeWhere((element) => element == "");
    return suggestions;
  }
}
class GetTimeSuggestions extends GetSuggestionsRepository {
  final LocalDataSource _source;
  late final  List<String> _data = [];
  GetTimeSuggestions({
    required LocalDataSource source,
  }) : _source = source;
  initialize() {
    _source.getAllLessons()
        .then((e) {
      for (var f in e) {
        _data.contains(f.time.start) ? null : _data.add(f.time.start);
      }
    });
  }
  @override
  Future<List<String>> call(String word, {offset}) async {
    if (_data.isEmpty) {
      await initialize();
    }
    final suggestions = _data.map((e) => e.toLowerCase().contains(word.toLowerCase()) ? e : "").toList();
    suggestions.removeWhere((element) => element == "");
    return suggestions;
  }
}