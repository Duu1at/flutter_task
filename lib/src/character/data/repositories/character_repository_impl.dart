import 'package:either_dart/either.dart';
import 'package:kdigital_test/src/character/data/datasources/character_remote_datasource.dart';
import 'package:kdigital_test/src/character/domain/entities/character.dart';
import 'package:kdigital_test/src/character/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<String, List<Character>>> fetchCharacters(int page) async {
    try {
      final characters = await remoteDataSource.fetchCharacters(page);
      return Right(characters);
    } catch (e) {
      return Left('Failed to fetch characters');
    }
  }
}
