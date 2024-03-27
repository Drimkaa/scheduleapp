

import 'package:postgres/postgres.dart';
class PostgresDataSource {
  late final Connection _connection ;

  PostgresDataSource();
bool _initialized = false;
  Future<void> initialize() async {
    try {
      _connection = await Connection.open(Endpoint(
        host: '127.0.0.1',
        port: 5433,
        database: 'schedule',
        username: 'postgres',
        password: '1111',

      ), settings: const ConnectionSettings( sslMode: SslMode.disable));
      _initialized = true;
    } catch(e) {
  print(e);
    }

  }

  Future<List<String>> getHEISuggestions(String word, {offset = 20}) async {
    if(_initialized) {
      final Result result = await _connection.execute(
          "SELECT name FROM vuzes WHERE LOWER(name) LIKE LOWER('%$word%') ORDER BY name LIMIT 20 OFFSET $offset");

      final List<String> matchingValues = result.map((row) => row[0].toString()).toList();
      return matchingValues;
    } else {
      return [];
    }

  }



  Future<void> close() async {
    try{
      await _connection.close();
    } catch(e) {
      print(e);
    }

  }
}