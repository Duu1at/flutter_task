import 'package:either_dart/either.dart';
import 'package:kdigital_test/src/character/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<Either<String, List<Character>>> fetchCharacters(int page);
}
