import 'package:flutter/material.dart';
import 'package:pokedex/data/models/pokemon_detail_model.dart';
import 'package:pokedex/presentation/pages/Home/widgets/pokemon_widget.dart';

class GridViewWidget extends StatefulWidget {
  final PokemonDetailsModel pokemonDetails;
  const GridViewWidget({
    super.key,
    required this.pokemonDetails,
  });

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return PokemonWidget(
      details: widget.pokemonDetails,
    );
  }
}
