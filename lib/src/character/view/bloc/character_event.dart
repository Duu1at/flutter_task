abstract class CharacterEvent {}

class FetchCharactersEvent extends CharacterEvent {
  final int page;

  FetchCharactersEvent(this.page);
}
