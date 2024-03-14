

import 'package:postgres/postgres.dart';
class PostgresDataSource {
  late final _connection;

  PostgresDataSource();

  Future<void> initialize() async {
    _connection = await Connection.open(Endpoint(
      host: '127.0.0.1',
      port: 5433,
      database: 'schedule',
      username: 'postgres',
      password: '1111',

    ), settings: ConnectionSettings( sslMode: SslMode.disable));
  }

  Future<List<String>> getHEISuggestions(String word, {offset = 20}) async {

      final Result result = await _connection.execute(
          "SELECT name FROM vuzes WHERE LOWER(name) LIKE '%${word}%' ORDER BY name LIMIT 20 OFFSET ${offset}");
      print(result);
      final List<String> matchingValues = result.map((row) => row[0].toString()).toList();
      return matchingValues;
  }



  Future<void> close() async {
    await _connection.close();
  }
}