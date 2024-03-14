

import 'package:scheduleapp/data/repositories/postgres_repository.dart';

class GetSuggestionsUseCase {
  final PostgresRepository _repository;

  GetSuggestionsUseCase(this._repository);

  Future<List<String>> call(String word,{offset}) async {
    return await _repository.getHEISuggestions(word,offset:offset);
  }
}
