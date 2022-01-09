import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemonflutter/models/get_list_pokemon.dart';

import 'dio.dart';

final listPokemonProvider = FutureProvider<GetListPokemonResponse?>((ref) async {
  final Dio dio = ref.read(dioProvider);
  try {
    final Response response = await dio.get("/pokemon/?limit=151");
    return GetListPokemonResponse.fromJson(response.data);
    // return tab;
  } catch (onError) {
    print(onError.toString());
  }
  
});
