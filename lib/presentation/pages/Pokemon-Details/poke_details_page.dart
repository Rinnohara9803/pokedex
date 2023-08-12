import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/data/models/pokemon_detail_model.dart';
import 'package:pokedex/presentation/pages/Pokemon-Details/widgets/image_animation_widget.dart';

class PokemonDetailsPage extends StatefulWidget {
  static String routeName = '/details-page';
  const PokemonDetailsPage({
    super.key,
  });

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final pokemonDetails = routeArgs['details'] as PokemonDetailsModel;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!kIsWeb)
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: Text(
                      pokemonDetails.name.toUpperCase(),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.lime,
                    ),
                  ),
                ],
              ),
              AnimatedImageAnimation(
                imageUrl: pokemonDetails.imageUrl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
