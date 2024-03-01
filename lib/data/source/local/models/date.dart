import 'package:hive/hive.dart';
import 'package:scheduleapp/data/source/local/models/week.dart';

part 'date.g.dart';

@HiveType(typeId: 2)
class DateHiveModel extends HiveObject{
  static const String boxKey = 'date';


  @HiveField(0)
  late int day;

  @HiveField(1)
  late WeekHiveModel type;

}
