// ToDo: Create A Class PokemonData To Store The Details We Receive From The PokeAPI
// This class should contain the Pokemon's official artwork, name, types and abilities

import 'package:flutter/material.dart';
class PokemonData{
  PokemonData({
    @required this.pokemonImageURL,
    @required this.pokemonName,
    @required this.pokemonTypes,
    @required this.pokemonAbilities,
  });

   String pokemonImageURL;
   String pokemonName;
   String pokemonTypes;
   String pokemonAbilities;
}