import 'package:flutter/material.dart';
import 'package:pokedex/data/models/pokemon_detail_model.dart';
import 'package:pokedex/presentation/pages/Pokemon-Details/widgets/image_animation_widget.dart';

class PokemonDetailsPage extends StatefulWidget {
  final PokemonDetailsModel pokemonDetails;
  const PokemonDetailsPage({super.key, required this.pokemonDetails});

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  @override
  Widget build(BuildContext context) {
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
                      widget.pokemonDetails.name.toUpperCase(),
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
                imageUrl: widget.pokemonDetails.imageUrl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
