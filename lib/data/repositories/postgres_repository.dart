
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