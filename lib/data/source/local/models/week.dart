import 'package:hive/hive.dart';

part 'week.g.dart';

@HiveType(typeId: 1)
class WeekHiveModel extends HiveObject{
  static const String boxKey = 'week';


  @HiveField(0)
  late String weeks;

}