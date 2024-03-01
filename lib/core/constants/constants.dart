const String newsAPIBaseURL = 'https://newsapi.org/v2/everything';
const String newsAPIKey = '5cb63d4ce6634c6db3464f2eee6759ae';
const String countryQuery = 'ru';
const String categoryQuery = 'general';

enum SubjectType {
  lesson,
  practice,
  lab;

  String toJson() => name;
  static SubjectType fromPos(int pos) => pos==0?SubjectType.lesson:(pos==1?SubjectType.practice:SubjectType.lab);
  static SubjectType fromJson(String json) => values.byName(json);
}

extension SubJectTypeExtension on SubjectType {
  int get pos {
    switch (this) {
      case SubjectType.lesson:
        return 0;
      case SubjectType.practice:
        return 1;
      case SubjectType.lab:
        return 2;
    }
  }
  String get fullName {
    switch (this) {
      case SubjectType.lesson:
        return "лекция";
      case SubjectType.practice:
        return "практика";
      case SubjectType.lab:
        return "лабораторная работа";
    }
  }

  String get shortName {
    switch (this) {
      case SubjectType.lesson:
        return "лекция";
      case SubjectType.practice:
        return "практика";
      case SubjectType.lab:
        return "лаб. раб.";
    }
  }
}

enum Weekday {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;
  String toJson() => name;
  static Weekday fromJson(String json) => values.byName(json);
  static Weekday fromPos(int pos) {
    switch (pos) {
      case 0:
        return Weekday.monday;
      case 1:
        return Weekday.tuesday;
      case 2:
        return Weekday.wednesday;
      case 3:
        return Weekday.thursday;
      case 4:
        return Weekday.friday;
      case 5:
        return Weekday.saturday;
      case 6:
        return Weekday.sunday;
      default: return Weekday.sunday;
    }
  }
}
extension WeekdayExtension on Weekday {
  int get pos {
    switch (this) {
      case Weekday.monday:
        return 0;
      case Weekday.tuesday:
        return 1;
      case Weekday.wednesday:
        return 2;
      case Weekday.thursday:
        return 3;
      case Weekday.friday:
        return 4;
      case Weekday.saturday:
        return 5;
      case Weekday.sunday:
        return 6;
    }
  }
  String get shortName  {
    switch (this){
      case Weekday.monday:
        return "Пн";
      case Weekday.tuesday:
        return "Вт";
      case Weekday.wednesday:
        return "Ср";
      case Weekday.thursday:
        return "Чт";
      case Weekday.friday:
        return "Пт";
      case Weekday.saturday:
        return "Сб";
      case Weekday.sunday:
        return "Вс";
    }
  }
  String get fullName {
    switch (this){
      case Weekday.monday:
        return "Понедельник";
      case Weekday.tuesday:
        return "Вторник";
      case Weekday.wednesday:
        return "Среда";
      case Weekday.thursday:
        return "Четверг";
      case Weekday.friday:
        return "Пятница";
      case Weekday.saturday:
        return "Суббота";
      case Weekday.sunday:
        return "Воскресенье";
    }
  }
}

enum LessonType {
  remote,
  person;

  String toJson() => name;
  static LessonType fromPos(int pos) => pos==0?LessonType.remote:LessonType.person;
  static LessonType fromJson(String json) => values.byName(json);
}
extension LessonTypeExtension on LessonType {
  int get pos {
    switch (this) {
      case LessonType.remote:
        return 0;
      case LessonType.person:
        return 1;
    }
  }
  String get fullName {
    switch (this) {
      case LessonType.remote:
        return "Дистанционно";
      case LessonType.person:
        return "Очно";
    }
  }
}