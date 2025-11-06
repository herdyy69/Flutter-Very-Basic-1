import 'package:flutter/foundation.dart';

class MovieProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _featuredMovies = [
    {
      'title': 'Spider-Man: No Way Home',
      'image': 'https://picsum.photos/400/600?random=1',
      'rating': '8.5',
      'genre': 'Action, Adventure',
      'year': '2021',
    },
    {
      'title': 'The Batman',
      'image': 'https://picsum.photos/400/600?random=2',
      'rating': '8.2',
      'genre': 'Action, Crime',
      'year': '2022',
    },
    {
      'title': 'Dune',
      'image': 'https://picsum.photos/400/600?random=3',
      'rating': '8.0',
      'genre': 'Sci-Fi, Adventure',
      'year': '2021',
    },
  ];

  final List<Map<String, dynamic>> _trendingMovies = [
    {
      'title': 'Top Gun: Maverick',
      'image': 'https://picsum.photos/400/600?random=4',
      'rating': '8.3',
      'genre': 'Action, Drama',
    },
    {
      'title': 'Black Widow',
      'image': 'https://picsum.photos/400/600?random=5',
      'rating': '6.7',
      'genre': 'Action, Adventure',
    },
    {
      'title': 'Eternals',
      'image': 'https://picsum.photos/400/600?random=6',
      'rating': '6.3',
      'genre': 'Action, Fantasy',
    },
    {
      'title': 'Shang-Chi',
      'image': 'https://picsum.photos/400/600?random=7',
      'rating': '7.4',
      'genre': 'Action, Adventure',
    },
  ];

  final List<Map<String, dynamic>> _likedMovies = [];

  final List<Map<String, dynamic>> _dislikedMovies = [];

  List<Map<String, dynamic>> get featuredMovies => _featuredMovies;
  List<Map<String, dynamic>> get trendingMovies => _trendingMovies;
  List<Map<String, dynamic>> get likedMovies => _likedMovies;
  List<Map<String, dynamic>> get dislikedMovies => _dislikedMovies;
  int get likedMoviesCount => _likedMovies.length;
  int get dislikedMoviesCount => _dislikedMovies.length;

  void likeMovie(Map<String, dynamic> movie) {
    if (!_likedMovies.any((m) => m['title'] == movie['title'])) {
      _likedMovies.add(movie);
      notifyListeners();
    }
  }

  void dislikeMovie(Map<String, dynamic> movie) {
    if (!_dislikedMovies.any((m) => m['title'] == movie['title'])) {
      _dislikedMovies.add(movie);
      notifyListeners();
    }
  }

  void unlikeMovie(Map<String, dynamic> movie) {
    _likedMovies.removeWhere((m) => m['title'] == movie['title']);
    notifyListeners();
  }

  void undislikeMovie(Map<String, dynamic> movie) {
    _dislikedMovies.removeWhere((m) => m['title'] == movie['title']);
    notifyListeners();
  }

  bool isLiked(Map<String, dynamic> movie) {
    return _likedMovies.any((m) => m['title'] == movie['title']);
  }

  bool isDisliked(Map<String, dynamic> movie) {
    return _dislikedMovies.any((m) => m['title'] == movie['title']);
  }
}
