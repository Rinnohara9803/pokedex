import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/presentation/pages/home/home_page.dart';
import 'package:pokedex/presentation/resources/themes_manager.dart';
import 'package:pokedex/providers/theme_provider.dart';

void main() {
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
        title: 'Pokemon Demo',
        theme: theme == Themes.dark
            ? getDarkApplicationTheme()
            : getLightApplicationTheme(),
        home: const HomePage(),

        // set up named routes
        // routes: {
        // },
      );
    });
  }
}
