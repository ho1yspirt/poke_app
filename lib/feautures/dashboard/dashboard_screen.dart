import 'package:flutter/material.dart';
import 'package:poke_app/core/assets/app_images.dart';
import 'package:poke_app/core/models/pokemon_model.dart';
import 'package:poke_app/core/themes/app_colors.dart';
import 'package:poke_app/core/themes/app_fonts.dart';
import 'package:poke_app/core/widgets/pokemon_list_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const PokemonModel pokemon = PokemonModel(
      id: 1,
      name: 'Wigglytuff',
      image: AppImages.pokemon,
      types: [
        'Poison',
        'Water',
        'Fight',
        'Bug',
        'Water',
        'Poison',
        'Fight',
      ],
      color: 'pink',
      weight: 75,
      height: 6,
      forms: 'arceus-bug',
      habitats: 'Cave',
      location: 'Kanto route 2 south towards viridian city',
      evolution: [
        {'name': 'Jigglepuff', 'image': AppImages.pokemon},
        {'name': 'Wigglytuff', 'image': AppImages.pokemon},
      ],
      stats: {
        'Health Point': 90,
        'Attack': 30,
        'Deffence': 87,
        'Speed': 45,
      },
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        toolbarHeight: 100,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PokeApp',
              style: AppFonts.w700s48.copyWith(color: AppColors.lightGray),
            ),
            const SizedBox(width: 7),
            Image.asset(
              AppImages.logo,
              height: 64,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pokemon list',
                style: AppFonts.w600s24.copyWith(color: AppColors.lightGray),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Find the pokemon you want',
                  style: AppFonts.w500s14.copyWith(color: AppColors.lightGray),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 143,
                      child: TextField(
                        style: AppFonts.w500s12
                            .copyWith(color: AppColors.lightGreen),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.gray,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelText: 'Search here...',
                          labelStyle: AppFonts.w500s12
                              .copyWith(color: AppColors.lightGreen),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    IconButton(
                      iconSize: 30,
                      onPressed: () {},
                      icon: const Icon(Icons.search_rounded),
                    ),
                  ],
                ),
              ),
              Container(
                color: AppColors.background,
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: ((context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: PokemonListCard(
                        pokemonData: pokemon,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
