import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';

class PokeApi {
  static const String _url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> _list = []; // boş olan listeyi doldurup return edeceğiz.

    var result = await Dio().get(_url);
    var pokeList =
        jsonDecode(result.data)['pokemon']; //internetten çekilen data

    if (pokeList is List) {
      _list = pokeList
          .map((e) => PokemonModel.fromJson(e))
          .toList(); //havada kalan veriler tek tek Pokemon nesnesine dönüştü
    } else {
      return [];
    }
    //debugPrint(pokeList['pokemon'].toString());

    return _list;
  }
}
