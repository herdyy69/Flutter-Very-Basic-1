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

  final List<Map<String, dynamic>> _history = [];

  final List<Map<String, dynamic>> _watchlist = [];

  List<Map<String, dynamic>> get featuredMovies => _featuredMovies;
  List<Map<String, dynamic>> get trendingMovies => _trendingMovies;
  List<Map<String, dynamic>> get likedMovies => _likedMovies;
  List<Map<String, dynamic>> get dislikedMovies => _dislikedMovies;
  List<Map<String, dynamic>> get history => _history;
  List<Map<String, dynamic>> get watchlist => _watchlist;
  int get likedMoviesCount => _likedMovies.length;
  int get dislikedMoviesCount => _dislikedMovies.length;
  int get watchlistCount => _watchlist.length;

  List<Map<String, dynamic>> get allMovies {
    return [..._featuredMovies, ..._trendingMovies];
  }

  List<Map<String, dynamic>> searchMovies(String query) {
    if (query.isEmpty) return allMovies;
    final lowerQuery = query.toLowerCase();
    return allMovies.where((movie) {
      final title = (movie['title'] ?? '').toLowerCase();
      final genre = (movie['genre'] ?? '').toLowerCase();
      return title.contains(lowerQuery) || genre.contains(lowerQuery);
    }).toList();
  }

  void likeMovie(Map<String, dynamic> movie) {
    if (!_likedMovies.any((m) => m['title'] == movie['title'])) {
      _likedMovies.add(movie);
      _addToHistory(movie, 'liked');
      notifyListeners();
    }
  }

  void dislikeMovie(Map<String, dynamic> movie) {
    if (!_dislikedMovies.any((m) => m['title'] == movie['title'])) {
      _dislikedMovies.add(movie);
      _addToHistory(movie, 'disliked');
      notifyListeners();
    }
  }

  void _addToHistory(Map<String, dynamic> movie, String action) {
    _history.insert(0, {
      ...movie,
      'action': action,
      'timestamp': DateTime.now().toIso8601String(),
    });
    if (_history.length > 100) {
      _history.removeRange(100, _history.length);
    }
  }

  void clearHistory() {
    _history.clear();
    notifyListeners();
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

  void addToWatchlist(Map<String, dynamic> movie) {
    if (!_watchlist.any((m) => m['title'] == movie['title'])) {
      _watchlist.add(movie);
      notifyListeners();
    }
  }

  void removeFromWatchlist(Map<String, dynamic> movie) {
    _watchlist.removeWhere((m) => m['title'] == movie['title']);
    notifyListeners();
  }

  bool isInWatchlist(Map<String, dynamic> movie) {
    return _watchlist.any((m) => m['title'] == movie['title']);
  }

  List<Map<String, dynamic>> getRecommendations() {
    if (_likedMovies.isEmpty) {
      return _trendingMovies.take(6).toList();
    }

    final likedGenres = <String, int>{};
    for (final movie in _likedMovies) {
      final genre = movie['genre'] as String? ?? '';
      final genres = genre.split(',').map((g) => g.trim()).toList();
      for (final g in genres) {
        likedGenres[g] = (likedGenres[g] ?? 0) + 1;
      }
    }

    final sortedGenres = likedGenres.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final topGenres = sortedGenres.take(3).map((e) => e.key).toList();

    final recommendations = <Map<String, dynamic>>[];
    final usedTitles = <String>{};

    for (final genre in topGenres) {
      for (final movie in allMovies) {
        if (usedTitles.contains(movie['title'])) continue;
        if (_likedMovies.any((m) => m['title'] == movie['title'])) continue;
        if (_dislikedMovies.any((m) => m['title'] == movie['title'])) continue;

        final movieGenres = (movie['genre'] as String? ?? '')
            .split(',')
            .map((g) => g.trim())
            .toList();
        if (movieGenres.contains(genre)) {
          recommendations.add(movie);
          usedTitles.add(movie['title'] as String);
          if (recommendations.length >= 6) break;
        }
      }
      if (recommendations.length >= 6) break;
    }

    while (recommendations.length < 6 &&
        recommendations.length < allMovies.length) {
      for (final movie in allMovies) {
        if (usedTitles.contains(movie['title'])) continue;
        if (_likedMovies.any((m) => m['title'] == movie['title'])) continue;
        if (_dislikedMovies.any((m) => m['title'] == movie['title'])) continue;
        recommendations.add(movie);
        usedTitles.add(movie['title'] as String);
        if (recommendations.length >= 6) break;
      }
      if (recommendations.length >= 6) break;
    }

    return recommendations;
  }

  List<String> getAllGenres() {
    final genres = <String>{};
    for (final movie in allMovies) {
      final genre = movie['genre'] as String? ?? '';
      final genreList = genre.split(',').map((g) => g.trim()).toList();
      genres.addAll(genreList);
    }
    return genres.toList()..sort();
  }

  List<Map<String, dynamic>> getMoviesByGenre(String genre) {
    return allMovies.where((movie) {
      final movieGenres = (movie['genre'] as String? ?? '')
          .split(',')
          .map((g) => g.trim())
          .toList();
      return movieGenres.contains(genre);
    }).toList();
  }
}
