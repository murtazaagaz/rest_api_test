import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/rick_n_morty_model.dart';
import 'package:flutter_assignment/services/api_services.dart';
import 'package:flutter_assignment/widgets/charater_item.dart';
import 'package:flutter_assignment/widgets/my_progress_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/character_bloc/character_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CharacterBloc characterBloc = CharacterBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    characterBloc.add(FetchCharactersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => characterBloc,
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            if (state is CharacterInitial) {
              return const MyProgressBar();
            }
            if (state is CharactersFetched) {
              List<RickNMortyCharacterModel> characterList = state.list;
              return ListView.builder(
                itemBuilder: (context, index) =>
                    CharacterItem(model: characterList[index]),
                itemCount: characterList.length,
              );
            }
            CharactersFailed failedState = state as CharactersFailed;
            return Center(
              child: Text(failedState.errorMessage),
            );
          },
        ),
      ),
    );
  }
}
