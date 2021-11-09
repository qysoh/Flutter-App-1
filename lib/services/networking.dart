// ToDo: Create A Class NetworkHelper To Help Us Deal With The Networking
// The class should be initialised with the root url and have a method to make a GET request to PokeAPI
// The method should then return the decoded response body if the request was successful,
// otherwise give an error if it wasn't
import 'package:http/http.dart' as http;
import 'dart:convert';
class NetworkHelper{
  final String url;

  NetworkHelper(this.url);

  Future getPokemonData(String pokemonName) async{
      final String endpoint = 'api/v2/pokemon/$pokemonName/';
      final http.Response response =await http.get(Uri.https(url, endpoint));

      if (response.statusCode ==200){
        return jsonDecode(response.body);
      }
      else{
        return 'Error';
      }

  }
}