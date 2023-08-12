import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/data/models/pokemon_detail_model.dart';
import 'package:pokedex/presentation/pages/Home/widgets/pokemon_widget.dart';
import 'package:pokedex/presentation/resources/strings_manager.dart';
import 'package:pokedex/providers/pokemon_provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PokemonsList extends StatefulWidget {
  const PokemonsList({
    super.key,
  });

  @override
  State<PokemonsList> createState() => _PokemonsListState();
}

class _PokemonsListState extends State<PokemonsList> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return FutureBuilder(
        future: ref
            .watch(
              pokemonListProvider.notifier,
            )
            .loadPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else {
            List<PokemonDetailsModel> pokemonList =
                ref.watch(pokemonListProvider);

            if (pokemonList.isEmpty) {
              return Center(
                child: Text(ErrorStrings.pokemonsNotFound),
              );
            } else if (kIsWeb) {
              return SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: ResponsiveBuilder(
                  builder: (context, si) {
                    if (si.deviceScreenType == DeviceScreenType.desktop) {
                      return gridsWidget(pokemonList, 5);
                    } else if (si.deviceScreenType == DeviceScreenType.tablet) {
                      return gridsWidget(pokemonList, 3);
                    } else {
                      return gridsWidget(pokemonList, 2);
                    }
                  },
                ),
              );
            }
            return gridsWidget(pokemonList, 2);
          }
        },
      );
    });
  }

  Widget gridsWidget(
      List<PokemonDetailsModel> pokemonList, int crossAxisCount) {
    return GridView.builder(
      shrinkWrap: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        crossAxisCount: crossAxisCount,
        childAspectRatio: 6 / 5,
      ),
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        final pokemon = pokemonList[index];
        return PokemonWidget(
          details: pokemon,
        );
      },
    );
  }
}
