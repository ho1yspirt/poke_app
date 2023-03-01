import 'package:flutter/material.dart';
import 'package:poke_app/core/themes/app_fonts.dart';

import '../themes/app_colors.dart';

class PokemonStatIndicator extends StatelessWidget {
  final num value;
  final String label;
  const PokemonStatIndicator({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppFonts.w500s12.copyWith(
              color: AppColors.lightGray,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                LinearProgressIndicator(
                  value: 0.01 * value.toDouble(),
                  minHeight: 25,
                  color: AppColors.red,
                  backgroundColor: AppColors.gray,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 4, 0, 3),
                  child: Text(
                    '${value.toInt()}%',
                    style: AppFonts.w500s12.copyWith(
                      color: AppColors.lightGray,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
