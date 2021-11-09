import 'package:flutter/material.dart';
import '../components/search_bar.dart';
import '../components/pokemon_card.dart';
import '../services/networking.dart';
import '../components/pokemon_data.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final textController = TextEditingController();


  NetworkHelper networkHelper = NetworkHelper('pokeapi.co');
PokemonData pokemonData = PokemonData(
  pokemonImageURL: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
  pokemonName: 'Pikachu',
  pokemonTypes: 'Electric',
  pokemonAbilities: 'Static Lightning-Rod');

  void getPokemonData() async {
    String queryString = textController.text.toLowerCase();
    var decodedData = await networkHelper.getPokemonData(queryString);

    if (decodedData != 'Error') {
      setState(() {
        pokemonData.pokemonImageURL = decodedData['sprites']['other']['official-artwork']['front_default'];
        pokemonData.pokemonName= decodedData['name'];
      });
    }
  }
  //ToDo: Create Function For SearchBar's OnEditingComplete Property Which Will Start The API Call
  // This function will need to get the input the user has entered, then use the NetworkHelper defined in networking.dart
  // to fetch data. Afterwards, it should update the state of the LandingPage by changing the properties of the
  // PokemonData class defined in pokemon_data.dart

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PokeDex',
        ),
      ),
      body: Column(
        children: [
          SearchBar(
            textController: textController,
            getPokemonData: getPokemonData,
          ),
          PokemonCard(
            pokemonURL: pokemonData.pokemonImageURL,
            pokemonName: pokemonData.pokemonName,
            pokemonType: pokemonData.pokemonTypes,
            pokemonAbility: pokemonData.pokemonAbilities,
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
