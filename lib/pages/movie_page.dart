import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../widgets/movie/movie_header.dart';
import '../widgets/movie/featured_carousel.dart';
import '../widgets/movie/trending_section.dart';
import '../widgets/movie/movie_swiper.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  final CardSwiperController _swiperController = CardSwiperController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MovieHeader(),
              const SizedBox(height: 20),
              FeaturedCarousel(
                movies: _featuredMovies,
                controller: _carouselController,
              ),
              const SizedBox(height: 30),
              TrendingSection(movies: _trendingMovies),
              const SizedBox(height: 20),
              MovieSwiper(
                movies: _trendingMovies,
                controller: _swiperController,
              ),
              const SizedBox(height: 80), // Space for bottom navigation
            ],
          ),
        ),
      ),
    );
  }
}
