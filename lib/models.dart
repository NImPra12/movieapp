class MovieInfo {
  final String title;

  final String poster;
  MovieInfo({
    required this.title,
    required this.poster,
  });

  factory MovieInfo.fromJson(Map<String, dynamic> json) {
    final title = json['Title'];
    final poster = json['Poster'];
    return MovieInfo(title: title, poster: poster);
  }
}

class MovieResponse {
  final MovieInfo movieInfo;
  MovieResponse({
    required this.movieInfo,
  });

  String get posterUrl {
    return movieInfo.poster;
  }

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    final movieInfoJson = json['Search'][0];
    final movieInfo = MovieInfo.fromJson(movieInfoJson);

    return MovieResponse(movieInfo: movieInfo);
  }
}
