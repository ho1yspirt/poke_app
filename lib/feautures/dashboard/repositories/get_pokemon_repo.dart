import 'package:dio/dio.dart';
import 'package:poke_app/feautures/dashboard/model/pokemons_model.dart';

class GetPokemonRepo {
  final Dio dio;
  const GetPokemonRepo({required this.dio});

  Future<PokemonsModel> getPokemons() async {
    final response = await dio.get('pokemon/');
    return PokemonsModel.fromJson(response.data);
  }
}
