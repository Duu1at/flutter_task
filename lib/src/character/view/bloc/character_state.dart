import 'package:equatable/equatable.dart';
import 'package:kdigital_test/src/character/domain/entities/character.dart';

abstract class CharacterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<Character> characters;
  final bool hasReachedMax;

  CharacterLoaded({
    required this.characters,
    required this.hasReachedMax,
  });

  CharacterLoaded copyWith({
    List<Character>? characters,
    bool? hasReachedMax,
  }) {
    return CharacterLoaded(
      characters: characters ?? this.characters,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [characters, hasReachedMax];
}

class CharacterError extends CharacterState {
  final String error;

  CharacterError(this.error);

  @override
  List<Object> get props => [error];
}
