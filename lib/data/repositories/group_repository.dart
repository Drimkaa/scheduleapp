import 'package:scheduleapp/data/entities/group/group_entity.dart';

import 'package:scheduleapp/data/source/local/hive_source.dart';
import 'package:scheduleapp/data/source/local/models/group/group.dart';
import 'package:scheduleapp/data/source/mapper/hive_to_entity.dart';

abstract class GroupRepository {
  const GroupRepository();

  Future<Group> getGroup();

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
      Group _group = Group(subgroup: 2, group: "21-СТ");


      await _localDataSource.saveGroup(GroupHiveModel()..subgroup=_group.subgroup..group=_group.group);
    }

    final group = await _localDataSource.getGroup();

    final returned = group.toEntity();

    return returned;
  }
}