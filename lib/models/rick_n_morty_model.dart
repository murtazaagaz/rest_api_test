import 'dart:convert';

class RickNMortyCharacterModel {
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final String location;
  final String dimension;

  RickNMortyCharacterModel({
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.location,
    required this.dimension,
  });

  factory RickNMortyCharacterModel.fromMap(Map<String, dynamic> map) {
    return RickNMortyCharacterModel(
      name: map['name'] ?? '',
      status: map['status'] ?? '',
      species: map['species'] ?? '',
      gender: map['gender'] ?? '',
      image: map['image'] ?? '',
      location: map['location']['name'] ?? '',
      dimension: map['origin']['name'] ?? '',
    );
  }
}
