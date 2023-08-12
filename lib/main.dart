import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pokedex/presentation/pages/Pokemon-Details/poke_details_page.dart';
import 'package:pokedex/presentation/pages/home/home_page.dart';
import 'package:pokedex/presentation/resources/themes_manager.dart';
import 'package:pokedex/providers/theme_provider.dart';

import 'data/models/pokemon.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PokemonAdapter());
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final theme = ref.watch(themeProvider);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokemon Demo',
        theme: theme == Themes.dark
            ? getDarkApplicationTheme()
            : getLightApplicationTheme(),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          PokemonDetailsPage.routeName: (context) => const PokemonDetailsPage(),
        },
      );
    });
  }
}
