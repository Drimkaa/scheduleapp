


import 'package:hive_flutter/hive_flutter.dart';
import 'package:scheduleapp/data/source/local/models/date.dart';
import 'package:scheduleapp/data/source/local/models/group/group.dart';
import 'package:scheduleapp/data/source/local/models/lesson.dart';
import 'package:scheduleapp/data/source/local/models/lesson_time.dart';
import 'package:scheduleapp/data/source/local/models/note.dart';
import 'package:scheduleapp/data/source/local/models/week.dart';
class LocalDataSource{
  const LocalDataSource();

  Future<void> initialize() async {
    await Hive.initFlutter("localhost");
    Hive.registerAdapter<WeekHiveModel>(WeekHiveModelAdapter());
    await Hive.openBox<WeekHiveModel>(WeekHiveModel.boxKey);
    Hive.registerAdapter<DateHiveModel>(DateHiveModelAdapter());
    await Hive.openBox<DateHiveModel>(DateHiveModel.boxKey);


    Hive.registerAdapter<LessonTimeHiveModel>(LessonTimeHiveModelAdapter());
    await Hive.openBox<LessonTimeHiveModel>(LessonTimeHiveModel.boxKey);
    Hive.registerAdapter<LessonHiveModel>(LessonHiveModelAdapter());
    await Hive.openBox<LessonHiveModel>(LessonHiveModel.boxKey);
    Hive.registerAdapter<NoteHiveModel>(NoteHiveModelAdapter());
    await Hive.openBox<NoteHiveModel>(NoteHiveModel.boxKey);

    Hive.registerAdapter<GroupHiveModel>(GroupHiveModelAdapter());
    await Hive.openBox<GroupHiveModel>(GroupHiveModel.boxKey);





  }

  Future<bool> hasLessonsData() async {
    final lessonBox = Hive.box<LessonHiveModel>(LessonHiveModel.boxKey);

    return lessonBox.length > 0;
  }
  Future<bool> hasGroupData() async {
    final box = Hive.box<GroupHiveModel>(GroupHiveModel.boxKey);

    return box.length > 0;
  }
  Future<void> saveGroup(GroupHiveModel object) async {
    final box = Hive.box<GroupHiveModel>(GroupHiveModel.boxKey);
    await box.clear();
    await box.put(1,object);
  }
  Future<GroupHiveModel> getGroup() async {
    final box = Hive.box<GroupHiveModel>(GroupHiveModel.boxKey);
    return box.get(1)!; // Используйте ключ вместо индекса
  }
  Future<bool> hasDateData() async {
    final dateBox = Hive.box<DateHiveModel>(DateHiveModel.boxKey);

    return dateBox.length > 0;
  }
  Future<bool> hasNoteData() async {
    final noteBox = Hive.box<NoteHiveModel>(NoteHiveModel.boxKey);

    return noteBox.length > 0;
  }

  Future<void> saveLessons(Iterable<LessonHiveModel> lessons) async {
    final lessonBox = Hive.box<LessonHiveModel>(LessonHiveModel.boxKey);

    final lessonsMap = {for (var e in lessons)  e.id:e};

    await lessonBox.clear();
    await lessonBox.putAll(lessonsMap);
  }

  Future<List<LessonHiveModel>> getAllLessons() async {
    final lessonBox = Hive.box<LessonHiveModel>(LessonHiveModel.boxKey);

    final lessons = List.generate(lessonBox.length, (index) => lessonBox.getAt(index))
        .whereType<LessonHiveModel>()
        .toList();

    return lessons;
  }


  Future<LessonHiveModel?> getLesson({required int id}) async {
    final lessonBox = Hive.box<LessonHiveModel>(LessonHiveModel.boxKey);
    return lessonBox.get(id);
  }

  Future<void> saveNotes(Iterable<NoteHiveModel> lessons) async {
    final noteBox = Hive.box<NoteHiveModel>(NoteHiveModel.boxKey);

    final notesMap = {for (var e in lessons) e.id: e};

    await noteBox.clear();
    await noteBox.putAll(notesMap);
  }

  Future<List<NoteHiveModel>> getAllNotes() async {
    final noteBox = Hive.box<NoteHiveModel>(NoteHiveModel.boxKey);

    final notes = List.generate(noteBox.length, (index) => noteBox.getAt(index))
        .whereType<NoteHiveModel>()
        .toList();

    return notes;
  }

  Future<List<NoteHiveModel>?> getLessonNotes({required int lessonId}) async {
    final noteBox = Hive.box<NoteHiveModel>(NoteHiveModel.boxKey);

    final notes = List.generate(noteBox.length, (index)  {NoteHiveModel? temp = noteBox.getAt(index); if(temp?.lessonId==lessonId) return temp;})
        .whereType<NoteHiveModel>()
        .toList();

    return notes;
  }

}