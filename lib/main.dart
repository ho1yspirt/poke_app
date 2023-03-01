import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poke_app/core/dio_settings.dart';
import 'package:poke_app/core/themes/app_colors.dart';
import 'package:poke_app/feautures/dashboard/bloc/dashboard_bloc.dart';
import 'package:poke_app/feautures/dashboard/dashboard_screen.dart';
import 'package:poke_app/core/themes/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/feautures/dashboard/repositories/get_pokemon_repo.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.background, // navigation bar color
      statusBarColor: AppColors.background, // status bar color
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => GetPokemonRepo(
            dio: RepositoryProvider.of<DioSettings>(context).dio,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DashboardBloc(
                repo: RepositoryProvider.of<GetPokemonRepo>(context)),
          ),
          // BlocProvider(
          //   create: (context) => SubjectBloc(),
          // ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: kDefaultTheme,
          debugShowCheckedModeBanner: false,
          home: const DashboardScreen(),
        ),
      ),
    );
  }
}
