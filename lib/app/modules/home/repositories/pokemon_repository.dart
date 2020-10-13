import 'package:dio/dio.dart';
import 'package:pokedex/app/shared/models/pokemon_model.dart';

class PokeRepository {
  final Dio dio;

  PokeRepository(this.dio);

  Future<List<PokemonModel>> getAllPokemons() async {
    List<PokemonModel> list = [];

    var response = await dio.get('/pokemon');
    for (var json in (response.data['results'] as List)) {
      PokemonModel model = PokemonModel(name: json['name']);
      list.add(model);
    }

    return list;
  }
}
