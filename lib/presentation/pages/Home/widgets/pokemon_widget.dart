import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/data/models/pokemon_detail_model.dart';
import 'package:pokedex/providers/theme_provider.dart';

import '../../Pokemon-Details/poke_details_page.dart';

class PokemonWidget extends ConsumerWidget {
  const PokemonWidget({
    super.key,
    required this.details,
  });

  final PokemonDetailsModel details;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final typeNames = details.types.map((type) => type).join(', ');
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PokemonDetailsPage(pokemonDetails: details),
          ),
        );
      },
      child: Container(
        color: Colors.transparent,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(
                  color: theme == Themes.dark ? Colors.lime : Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: details.imageUrl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => const Icon(
                      Icons.catching_pokemon,
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.catching_pokemon_rounded,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 15,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: 'Name: '),
                        TextSpan(
                          text: details.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: 'Type: '),
                        TextSpan(
                          text: typeNames,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
