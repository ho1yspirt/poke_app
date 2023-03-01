import 'package:flutter/material.dart';
import 'package:poke_app/core/models/pokemon_model.dart';
import 'package:poke_app/core/themes/app_colors.dart';
import 'package:poke_app/core/themes/app_fonts.dart';
import 'package:poke_app/feautures/detailstats/detailstats_screen.dart';

class PokemonListCard extends StatelessWidget {
  final PokemonModel pokemonData;

  const PokemonListCard({
    super.key,
    required this.pokemonData,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailStatsScreen(
                pokemonData: pokemonData,
              ),
            ),
          ),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: double.infinity,
            height: 75,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.gray,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pokemonData.name,
                  style: AppFonts.w500s18.copyWith(color: AppColors.lightGray),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.asset(pokemonData.image, width: 100),
          ),
        ),
      ],
    );
  }
}
