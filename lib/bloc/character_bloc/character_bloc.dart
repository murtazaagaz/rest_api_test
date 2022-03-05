import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_assignment/models/rick_n_morty_model.dart';
import 'package:flutter_assignment/services/api_services.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  late ApiServices _apiServices;
  CharacterBloc() : super(CharacterInitial()) {
    _apiServices = ApiServices();
    on<FetchCharactersEvent>(_fetchContent);
  }

  _fetchContent(event, Emitter emit) async {
    emit(CharacterInitial());

    http.Response response = await _apiServices.fetchCharacters();

    List<RickNMortyCharacterModel> list = [];

    try {
      Map result = jsonDecode(response.body);

      print('MU RESULT:: $result');
      if (response.statusCode == 200) {
        for (Map<String, dynamic> data in result['results']) {
          list.add(RickNMortyCharacterModel.fromMap(data));
        }

        emit(CharactersFetched(list: list));
      } else {
        emit(CharactersFailed(errorMessage: result['error']));
      }
    } catch (e) {
      emit(CharactersFailed(errorMessage: 'server error'));
    }
  }
}
