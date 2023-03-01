import 'package:flutter/material.dart';
import 'package:poke_app/core/themes/app_colors.dart';
import 'package:poke_app/core/themes/app_fonts.dart';

class PokemonTypeChip extends StatelessWidget {
  final String label;
  const PokemonTypeChip({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: AppFonts.w500s12.copyWith(color: AppColors.lightGray),
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      backgroundColor: AppColors.gray,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      side: const BorderSide(
        color: Colors.transparent,
      ),
    );
  }
}
