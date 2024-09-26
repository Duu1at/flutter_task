import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/character/domain/usecases/fetch_characters.dart';
import 'character_event.dart';
import 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final FetchCharacters fetchCharacters;

  CharacterBloc(this.fetchCharacters) : super(CharacterInitial()) {
    on<FetchCharactersEvent>(_onFetchCharactersEvent);
  }

  Future<void> _onFetchCharactersEvent(FetchCharactersEvent event, Emitter<CharacterState> emit) async {
    try {
      if (state is CharacterLoaded) {
        final currentState = state as CharacterLoaded;
        if (!currentState.hasReachedMax) {
          final characters = await fetchCharacters.execute(event.page);

          characters.fold(
            (failure) => emit(CharacterError(failure)),
            (newCharacters) {
              emit(
                newCharacters.isEmpty
                    ? currentState.copyWith(hasReachedMax: true)
                    : currentState.copyWith(
                        characters: currentState.characters + newCharacters,
                        hasReachedMax: false,
                      ),
              );
            },
          );
        }
      } else {
        emit(CharacterLoading());
        final characters = await fetchCharacters.execute(event.page);

        characters.fold(
          (failure) => emit(CharacterError(failure)),
          (newCharacters) {
            emit(CharacterLoaded(characters: newCharacters, hasReachedMax: newCharacters.isEmpty));
          },
        );
      }
    } catch (e) {
      emit(CharacterError(e.toString()));
    }
  }
}
