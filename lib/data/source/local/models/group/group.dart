import 'package:hive/hive.dart';

part 'group.g.dart';

@HiveType(typeId: 11)
class GroupHiveModel extends HiveObject{
  static const String boxKey = 'group';

  @HiveField(0)
  late int subgroup;

  @HiveField(1)
  late String group;

}
