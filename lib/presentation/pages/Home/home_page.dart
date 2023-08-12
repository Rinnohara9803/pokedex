import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pokedex/presentation/pages/Home/pokemons_list.dart';
import 'package:pokedex/presentation/resources/strings_manager.dart';
import 'package:pokedex/providers/pokemon_provider.dart';

import '../../../providers/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Consumer(builder: (context, ref, child) {
          final theme = ref.watch(themeProvider);
          return FloatingActionButton(
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
            child: Icon(
              theme == Themes.dark ? Icons.light : Icons.dark_mode_outlined,
            ),
          );
        }),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: Column(
            children: [
              Column(
                children: [
                  if (kIsWeb)
                    Text(
                      StringsManager.primarySearchTitle,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  Text(
                    StringsManager.primarySearchTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final theme = ref.watch(themeProvider);
                  return TextField(
                    controller: _searchController,
                    cursorColor:
                        theme == Themes.dark ? Colors.lime : Colors.black87,
                    style: TextStyle(
                      fontSize: 14,
                      color: theme == Themes.dark ? Colors.white : Colors.black,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: StringsManager.searchPokemonLabel,
                      labelStyle: TextStyle(
                        color:
                            theme == Themes.dark ? Colors.white : Colors.black,
                      ),
                      hintStyle: TextStyle(
                        color:
                            theme == Themes.dark ? Colors.white : Colors.black,
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    onChanged: (value) {
                      ref
                          .read(pokemonListProvider.notifier)
                          .searchPokemons(value);
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Expanded(
                child: PokemonsList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
