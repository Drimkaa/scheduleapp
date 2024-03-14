import 'package:scheduleapp/data/entities/group/group_entity.dart';

import 'package:scheduleapp/data/source/local/hive_source.dart';
import 'package:scheduleapp/data/source/local/models/group/group.dart';
import 'package:scheduleapp/data/source/mapper/hive_to_entity.dart';
import 'package:scheduleapp/data/source/postgres/postgres_source.dart';

abstract class PostgresRepository {
  const PostgresRepository();

  Future<List<String>> getHEISuggestions(String word, {offset});

}

class PostgresRepositoryImpl extends PostgresRepository {
  final PostgresDataSource _source;

  const PostgresRepositoryImpl({
    required PostgresDataSource source,
  })  :
        _source = source;

  @override
  Future<List<String>> getHEISuggestions(String word, {offset}) async {
    final suggestions = await _source.getHEISuggestions( word, offset:offset);
    return suggestions;
  }
}