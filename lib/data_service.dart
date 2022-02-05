import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models.dart';

class DataService {
  Future<MovieResponse> getMovie(String title) async {
    //http://www.omdbapi.com/?t=spiderman
    //http://www.omdbapi.com/?apikey=[yourkey]&

    final queryParameters = {
      's': title,
      'apikey': 'c32d25ae',
    };

    final uri = Uri.https('omdbapi.com', '/', queryParameters);

    final response = await http.get(uri);
    print(response.body);
    final json = jsonDecode(response.body);
    print(json);
    return MovieResponse.fromJson(json);
  }
}
