import 'package:scheduleapp/data/entities/group/group_entity.dart';

import 'package:scheduleapp/data/source/local/hive_source.dart';
import 'package:scheduleapp/data/source/local/models/group/group.dart';
import 'package:scheduleapp/data/source/mapper/hive_to_entity.dart';

abstract class GroupRepository {
  const GroupRepository();

  Future<Group> getGroup();
  Future<void> setSubgroup(int subgroup);

}

class GroupRepositoryImpl extends GroupRepository {
  final LocalDataSource _localDataSource;

  const GroupRepositoryImpl({
    required LocalDataSource localDataSource,
  })  :
        _localDataSource = localDataSource;

  @override
  Future<Group> getGroup() async {
    final hasCachedData = await _localDataSource.hasGroupData();

    if (!hasCachedData) {
      Group group0 = const Group(subgroup: 2, group: "21-СТ");


      await _localDataSource.saveGroup(GroupHiveModel()..subgroup=group0.subgroup..group=group0.group);
    }

    final group = await _localDataSource.getGroup();

    final returned = group.toEntity();

    return returned;
  }
  @override
  @override
  Future<void> setSubgroup(int subgroup) async {

    final hasCachedData = await _localDataSource.hasGroupData();

    if (!hasCachedData) {
      Group group0 = const Group(subgroup: 2, group: "21-СТ");

      await _localDataSource.saveGroup(
        GroupHiveModel()
          ..subgroup = group0.subgroup
          ..group = group0.group,
      );
    } else {
      final value = await _localDataSource.getGroup();

      await _localDataSource.saveGroup(
        GroupHiveModel()
          ..subgroup = subgroup
          ..group = value.group,
      );
    }

  }
}