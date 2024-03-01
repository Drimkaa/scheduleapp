




import 'package:scheduleapp/core/constants/constants.dart';
import 'package:scheduleapp/data/entities/date_entity.dart';
import 'package:scheduleapp/data/entities/lesson_entity.dart';
import 'package:scheduleapp/data/entities/lesson_time_entity.dart';
import 'package:scheduleapp/data/entities/week_entity.dart';

var subjects = [
  "Моделирование систем",                         // 0
  "Корпоративные информационные системы",         // 1
  "Управление данными",                           // 2
  "Администрирование информационных систем",      // 3
  "Разработка сетевых приложений",                // 4
  "Технологии обработки информации",              // 5
  "Правоведение",                                 // 6
  "Элективные курсы по физической культуре и "
      "спорту, спортивные площадки общежития №3", // 7
];
List<String> teachers = [
  "Балашова Татьяна Ивановна",
      // 0
  "Дмитриева Наталья Глебовна",     // 1
  "Ляхманов Дмитрий Александрович", // 2
  "Киров Дмитрий Игоревич",         // 3
  "Волков Михаил Борисович",        // 4
  "Дабагян Анна Артемовна",         // 5
  " ",                          // 6
];
var classrooms = [
  "1352",    // 0
  "3208",    // 1
  "4201"     // 2
      "4311",    // 3
  "4404",    // 4 +
  "4409",    // 5 +
  "6302",    // 6 +
  "6336",    // 7 +
  "6510",    // 8 +
  "3 общага" // 9 +
];
var weekType = [
  "Четная",   // 0
  "Нечётная", // 1
  "Любая",    // 2
];
List<LessonTime> times = [
  const LessonTime(start:'8:00', end:'9:35',  label: "1 пара"),   // 0
  const LessonTime(start:'9:45', end:'11:20', label: "2 пара"),  // 1
  const LessonTime(start:'11:35',end: '13:10',label: "3 пара"), // 2
  const LessonTime(start:'13:40',end: '15:15',label: "4 пара"), // 3
  const LessonTime(start:'15:25',end: '17:00',label: "5 пара"), // 4
  const LessonTime(start:'17:10',end: '18:45',label: "6 пара"), // 5
  const LessonTime(start:'7:30', end:'9:05',  label: "1 пара"),   // 6
  const LessonTime(start:'9:20', end:'10:55', label: "2 пара"),  // 7
  const LessonTime(start:'11:10',end: '12:45',label: "3 пара"), // 8
  const LessonTime(start:'13:15',end: '14:50',label: "4 пара"), // 9
  const LessonTime(start:'15:00',end: '16:35',label: "5 пара"), // 10
  const LessonTime(start:'16:45',end: '18:20',label: "6 пара"), // 11
];
var subgroups = [
  0, 1, 2
];

List<Lesson> lessonsList = [
  Lesson(id:"xbwqyboyF",subject:subjects[0], subjectType: SubjectType.lab, teacher:teachers[1], lessonType:LessonType.person, time:times[7], classroom: "4311", date:const Date(day:Weekday.monday,type:Week(weeks:"3 7 11 15")),subgroup: 1),
  Lesson(id:"EtpcUrXrG",subject:subjects[0], subjectType:SubjectType.lab, teacher:teachers[1], lessonType:LessonType.person,  time:times[8], classroom:"4311", date:const Date(day:Weekday.monday,type:Week(weeks:"3 7 11 15")), subgroup:1),
  Lesson(id:"GxkHhmtzv",subject:subjects[0], subjectType:SubjectType.lab, teacher:teachers[1], lessonType:LessonType.person,  time:times[7], classroom:"4311", date:const Date(day:Weekday.monday,type:Week(weeks:"5 9 13 17")), subgroup:2),
  Lesson(id:"GdwYgSCCL",subject:subjects[0], subjectType:SubjectType.lab, teacher:teachers[1], lessonType:LessonType.person,  time:times[8], classroom:"4311", date:const Date(day:Weekday.monday,type:Week(weeks:"5 9 13 17")), subgroup:2),
  Lesson(id:"lnQnpZHjX",subject:subjects[1], subjectType:SubjectType.lesson, teacher:teachers[1], lessonType:LessonType.person,  time:times[9], classroom:"4201",date: Date(day:Weekday.monday,type:Week(weeks:weekType[2])), subgroup:0),
  Lesson(id:"XBWGrTzCb",subject:subjects[0], subjectType:SubjectType.practice, teacher:teachers[1], lessonType:LessonType.person,  time:times[10],classroom: "4311",date: Date(day:Weekday.monday,type:Week(weeks:weekType[0])),subgroup: 0),

  Lesson(id:"AUHOvwWjE",subject:subjects[7], subjectType:SubjectType.practice, teacher:teachers[6], lessonType:LessonType.person, time: times[0],classroom: "3 общага", date:Date(day:Weekday.tuesday,type:Week(weeks:weekType[2])), subgroup:0),
  Lesson(id:"hHZBKFbTw",subject:subjects[2], subjectType:SubjectType.lab, teacher:teachers[0], lessonType:LessonType.person,  time:times[8], classroom:"4404", date:Date(day:Weekday.tuesday,type:Week(weeks:weekType[0])), subgroup:2),
  Lesson(id:"ggbFfkQXP",subject:subjects[2], subjectType:SubjectType.lab, teacher:teachers[0], lessonType:LessonType.person,  time:times[8], classroom:"4404", date:Date(day:Weekday.tuesday,type:Week(weeks:weekType[1])), subgroup:1),
  Lesson(id:"DtpJeBOeC",subject:subjects[2], subjectType:SubjectType.lab, teacher:teachers[0], lessonType:LessonType.person,  time:times[9], classroom:"4404", date:Date(day:Weekday.tuesday,type:Week(weeks:weekType[0])), subgroup:2),
  Lesson(id:"VFyyPjEeN",subject:subjects[2], subjectType:SubjectType.lab, teacher:teachers[0], lessonType:LessonType.person,  time:times[9], classroom:"4404", date:Date(day:Weekday.tuesday,type:Week(weeks:weekType[1])), subgroup:1),
  Lesson(id:"jCPFUPgZW",subject:subjects[3], subjectType:SubjectType.lab, teacher:teachers[2], lessonType:LessonType.person,  time:times[10],classroom:"4409", date:Date(day:Weekday.tuesday,type:Week(weeks:weekType[0])), subgroup:1),
  Lesson(id:"ihnmpIKYd",subject:subjects[3], subjectType:SubjectType.lab, teacher:teachers[2], lessonType:LessonType.person,  time:times[10],classroom:"4409", date:Date(day:Weekday.tuesday,type:Week(weeks:weekType[1])), subgroup:2),
  Lesson(id:"ZixNSibAP",subject:subjects[3], subjectType:SubjectType.lab, teacher:teachers[2], lessonType:LessonType.person,  time:times[11],classroom:"4409", date:Date(day:Weekday.tuesday,type:Week(weeks:weekType[0])), subgroup:1),
  Lesson(id:"KFUDuNGUn",subject:subjects[3], subjectType:SubjectType.lab, teacher:teachers[2], lessonType:LessonType.person,  time:times[11],classroom:"4409", date:Date(day:Weekday.tuesday,type:Week(weeks:weekType[1])), subgroup:2),

  Lesson(id:"jDPDrjCPr",subject:subjects[4], subjectType:SubjectType.lesson, teacher:teachers[3], lessonType:LessonType.person,  time:times[9],classroom: "3208", date:Date(day:Weekday.wednesday,type:Week(weeks:weekType[2])), subgroup:0),
  Lesson(id:"BxdqyKEnB",subject:subjects[1], subjectType:SubjectType.lab, teacher:teachers[1], lessonType:LessonType.person,  time:times[10],classroom: "4311", date:Date(day:Weekday.wednesday,type:Week(weeks:weekType[0])), subgroup:1),
  Lesson(id:"wIvExisjL",subject:subjects[1], subjectType:SubjectType.lab, teacher:teachers[1], lessonType:LessonType.person,  time:times[10],classroom: "4311", date:Date(day:Weekday.wednesday,type:Week(weeks:weekType[1])), subgroup:2),
  Lesson(id:"JUWluHdcu",subject:subjects[1], subjectType:SubjectType.lab, teacher:teachers[1], lessonType:LessonType.person,  time:times[11],classroom: "4311", date:Date(day:Weekday.wednesday,type:Week(weeks:weekType[0])), subgroup:1),
  Lesson(id:"ICnfBbUUC",subject:subjects[1], subjectType:SubjectType.lab, teacher:teachers[1], lessonType:LessonType.person,  time:times[11],classroom: "4311", date:Date(day:Weekday.wednesday,type:Week(weeks:weekType[1])), subgroup:2),
  Lesson(id:"nEAwAUajr",subject:subjects[4], subjectType:SubjectType.lab, teacher:teachers[3], lessonType:LessonType.person,  time:times[10],classroom: "1352", date:Date(day:Weekday.wednesday,type:Week(weeks:weekType[0])), subgroup:2),
  Lesson(id:"UmflRtApQ",subject:subjects[4], subjectType:SubjectType.lab, teacher:teachers[3], lessonType:LessonType.person,  time:times[10],classroom: "1352", date:Date(day:Weekday.wednesday,type:Week(weeks:weekType[1])), subgroup:1),
  Lesson(id:"NhJEtjPuf",subject:subjects[4], subjectType:SubjectType.lab, teacher:teachers[3], lessonType:LessonType.person,  time:times[11],classroom: "1352", date:Date(day:Weekday.wednesday,type:Week(weeks:weekType[0])), subgroup:2),
  Lesson(id:"JTrcYYsXX",subject:subjects[4], subjectType:SubjectType.lab, teacher:teachers[3], lessonType:LessonType.person,  time:times[11],classroom: "1352", date:Date(day:Weekday.wednesday,type:Week(weeks:weekType[1])), subgroup:1),

  Lesson(id:"AjhLMJXOm",subject:subjects[2], subjectType:SubjectType.lesson, teacher:teachers[0], lessonType:LessonType.person,  time:times[0], classroom:"6510", date:Date(day:Weekday.thursday,type:Week(weeks:weekType[2])), subgroup:0),
  Lesson(id:"CoywnwGvo",subject:subjects[3], subjectType:SubjectType.lesson, teacher:teachers[2], lessonType:LessonType.person,  time:times[1], classroom:"6510", date:Date(day:Weekday.thursday,type:Week(weeks:weekType[2])), subgroup:0),
  Lesson(id:"CYZNRjHhf",subject:subjects[5], subjectType:SubjectType.lesson, teacher:teachers[4], lessonType:LessonType.person,  time:times[2], classroom:"6510", date:Date(day:Weekday.thursday,type:Week(weeks:weekType[2])), subgroup:0),
  Lesson(id:"KxUflppWw",subject:subjects[6], subjectType:SubjectType.lesson,   teacher:teachers[5], lessonType:LessonType.person,  time:times[3], classroom:"6510",date:Date(day:Weekday.thursday,type:Week(weeks:weekType[0])), subgroup:0),
  Lesson(id:"quujrwmSG",subject:subjects[6], subjectType:SubjectType.practice, teacher:teachers[5], lessonType:LessonType.person,  time:times[4], classroom:"6302",date:Date(day:Weekday.thursday,type:Week(weeks:weekType[0])), subgroup:0),
  Lesson(id:"bJSTVunAI",subject:subjects[0], subjectType:SubjectType.lesson, teacher:teachers[1], lessonType:LessonType.person,  time:times[8], classroom:"4201", date:Date(day:Weekday.friday,type:Week(weeks:weekType[2])), subgroup:0),
];

