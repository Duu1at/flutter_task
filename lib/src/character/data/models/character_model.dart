import 'package:json_annotation/json_annotation.dart';
import 'package:kdigital_test/src/character/domain/entities/character.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel extends Character {
  CharacterModel({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required String image,
    required String url,
    required String created,
  }) : super(
          id: id,
          name: name,
          status: status,
          species: species,
          type: type,
          gender: gender,
          image: image,
          url: url,
          created: created,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
