import 'package:flutter/material.dart';
import 'package:poke_app/core/models/pokemon_model.dart';
import 'package:poke_app/core/themes/app_colors.dart';
import 'package:poke_app/core/themes/app_fonts.dart';
import 'package:poke_app/core/widgets/pokemon_stat_indicator.dart';
import 'package:poke_app/core/widgets/pokemon_type_chip.dart';

class DetailStatsScreen extends StatelessWidget {
  final PokemonModel pokemonData;
  const DetailStatsScreen({
    super.key,
    required this.pokemonData,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.background,
          toolbarHeight: 100,
          centerTitle: true,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(Icons.arrow_back_rounded),
                  iconSize: 48,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: AppColors.lightGray,
                  ),
                ),
              ),
              Text(
                'PokeApp',
                style: AppFonts.w700s48.copyWith(color: AppColors.lightGray),
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 10),
                child: Text(
                  pokemonData.name,
                  style: AppFonts.w600s24.copyWith(color: AppColors.lightGray),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TabBar(
                  isScrollable: true,
                  dividerColor: Colors.white.withAlpha(0),
                  indicatorColor: AppColors.lightGray,
                  tabs: [
                    Tab(
                      child: Text(
                        'Stats',
                        style: AppFonts.w400s14
                            .copyWith(color: AppColors.lightGray),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Evolution',
                        style: AppFonts.w400s14
                            .copyWith(color: AppColors.lightGray),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Stats V2',
                        style: AppFonts.w400s14
                            .copyWith(color: AppColors.lightGray),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    buildDetailStatsTabPage(),
                    buildDetailEvolutionTabPage(),
                    buildDetailStatsV2TabPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailStatsTabPage() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: buildTitle(title: 'Biodata'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSubtitle(title: 'Name:'),
                    buildTextBody(title: pokemonData.name),
                    const SizedBox(height: 5),
                    buildSubtitle(title: 'Forms:'),
                    buildTextBody(title: pokemonData.forms),
                    const SizedBox(height: 5),
                    buildSubtitle(title: 'Color:'),
                    buildTextBody(title: pokemonData.color),
                    const SizedBox(height: 5),
                    buildSubtitle(title: 'Height:'),
                    buildTextBody(title: '${pokemonData.height} decimeters'),
                    const SizedBox(height: 5),
                    buildSubtitle(title: 'Weight:'),
                    buildTextBody(title: '${pokemonData.weight} hectogram'),
                  ],
                ),
                Image.asset(
                  pokemonData.image,
                  width: 140,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: buildTitle(title: 'Habitats & Location Areas'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSubtitle(title: 'Habitats:'),
                  buildTextBody(title: pokemonData.habitats),
                  buildSubtitle(title: 'Location:'),
                  buildTextBody(title: pokemonData.location),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 12),
              child: buildTitle(title: 'Types'),
            ),
            Wrap(
              spacing: 8,
              children: List.generate(
                pokemonData.types.length,
                (index) => PokemonTypeChip(
                  label: pokemonData.types[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailStatsV2TabPage() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    pokemonData.image,
                    width: 140,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(
                  width: 17,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: buildTitle(title: 'Biodata'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildSubtitle(title: 'Name:'),
                              buildTextBody(title: pokemonData.name),
                              const SizedBox(height: 5),
                              buildSubtitle(title: 'Height:'),
                              buildTextBody(title: '${pokemonData.height} dm'),
                              const SizedBox(height: 5),
                              buildSubtitle(title: 'Color:'),
                              buildTextBody(title: pokemonData.color),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              buildSubtitle(title: 'Forms:'),
                              buildTextBody(title: pokemonData.forms),
                              const SizedBox(height: 5),
                              const SizedBox(height: 5),
                              buildSubtitle(title: 'Weight:'),
                              buildTextBody(title: '${pokemonData.weight} hg'),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Wrap(
                spacing: 8,
                children: List.generate(
                  pokemonData.types.length,
                  (index) => PokemonTypeChip(
                    label: pokemonData.types[index],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: buildTitle(title: 'Stats'),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: pokemonData.stats.length,
              itemBuilder: (context, index) => PokemonStatIndicator(
                value: pokemonData.stats.entries.elementAt(index).value,
                label: pokemonData.stats.entries.elementAt(index).key,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailEvolutionTabPage() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: buildTitle(title: 'Evolution Chains'),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: pokemonData.evolution.length,
              itemBuilder: (context, index) => buildEvolutionCard(
                index: index + 1,
                title: pokemonData.evolution[index]['name'],
                image: pokemonData.evolution[index]['image'],
                color: pokemonData.name == pokemonData.evolution[index]['name']
                    ? AppColors.red
                    : AppColors.gray,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEvolutionCard({
    required int index,
    required String title,
    required String image,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '${index}st form',
              style: AppFonts.w400s12.copyWith(
                color: AppColors.lightGray,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: color,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Image.asset(
                    image,
                    height: 75,
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style:
                        AppFonts.w500s12.copyWith(color: AppColors.lightGray),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitle({required String title}) {
    return Text(
      title,
      style: AppFonts.w500s14.copyWith(
        color: AppColors.lightGray,
      ),
    );
  }

  Widget buildSubtitle({required String title}) {
    return Text(
      title,
      style: AppFonts.w400s12.copyWith(
        color: AppColors.lightGray,
      ),
    );
  }

  Widget buildTextBody({required String title}) {
    return Text(
      title,
      style: AppFonts.w300s11.copyWith(
        color: AppColors.lightGray,
      ),
    );
  }
}
