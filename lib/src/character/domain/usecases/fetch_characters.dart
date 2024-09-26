import 'package:either_dart/either.dart';
import 'package:kdigital_test/src/character/domain/entities/character.dart';
import 'package:kdigital_test/src/character/domain/repositories/character_repository.dart';

class FetchCharacters {
  final CharacterRepository repository;

  FetchCharacters(this.repository);

  Future<Either<String, List<Character>>> execute(int page) {
    return repository.fetchCharacters(page);
  }
}
