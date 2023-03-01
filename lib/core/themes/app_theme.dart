import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_app/core/themes/app_colors.dart';

ThemeData kDefaultTheme = ThemeData(
  textTheme: GoogleFonts.poppinsTextTheme(),
  useMaterial3: true,
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: AppColors.gray,
      foregroundColor: AppColors.lightGreen,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
);
