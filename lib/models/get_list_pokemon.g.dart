// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_list_pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetListPokemonResponse _$GetListPokemonResponseFromJson(
        Map<String, dynamic> json) =>
    GetListPokemonResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetListPokemonResponseToJson(
        GetListPokemonResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
