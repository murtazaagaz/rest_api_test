part of 'character_bloc.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharactersFetched extends CharacterState {
  List<RickNMortyCharacterModel> list;
  CharactersFetched({
    required this.list,
  });
}

class CharactersFailed extends CharacterState {
  final String errorMessage;
  CharactersFailed({
    required this.errorMessage,
  });
}
