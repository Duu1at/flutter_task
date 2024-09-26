import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:kdigital_test/src/character/data/datasources/character_remote_datasource.dart';
import 'package:kdigital_test/src/character/data/repositories/character_repository_impl.dart';
import 'package:kdigital_test/src/character/domain/repositories/character_repository.dart';
import 'package:kdigital_test/src/character/domain/usecases/fetch_characters.dart';

final GetIt sl = GetIt.instance;

void init() {
  sl.registerLazySingleton<Client>(() => Client());

  sl.registerLazySingleton<CharacterRemoteDataSource>(
    () => CharacterRemoteDataSource(sl()),
  );

  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => FetchCharacters(sl()));
}
