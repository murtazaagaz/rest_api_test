import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/rick_n_morty_model.dart';
import 'package:flutter_assignment/screens/character_detail.dart';

class CharacterItem extends StatelessWidget {
  final RickNMortyCharacterModel model;
  const CharacterItem({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterDetail(
              model: model,
            ),
          )),
      child: Row(
        children: [
          Image.network(
            model.image,
            height: 50,
            width: 50,
          ),
          Column(
            children: [
              Text(model.name),
              Row(
                children: [
                  const Text(
                    'Location ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    model.location,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Species ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    model.species,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
