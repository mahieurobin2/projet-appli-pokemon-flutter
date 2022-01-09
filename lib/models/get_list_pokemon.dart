

import 'package:json_annotation/json_annotation.dart';
import 'result.dart';

part 'get_list_pokemon.g.dart';

@JsonSerializable()
class GetListPokemonResponse{

final List<Result>? results;


GetListPokemonResponse(this.results);

factory GetListPokemonResponse.fromJson(Map<String,dynamic> json) =>_$GetListPokemonResponseFromJson(json);

Map<String, dynamic> toJson() => _$GetListPokemonResponseToJson(this);

}
