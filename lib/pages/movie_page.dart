import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';
import '../widgets/movie/movie_header.dart';
import '../widgets/movie/featured_carousel.dart';
import '../widgets/movie/trending_section.dart';
import '../widgets/movie/movie_swiper.dart';
import '../widgets/movie/liked_movies_section.dart';
import '../widgets/movie/disliked_movies_section.dart';
import '../providers/movie_provider.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  final CardSwiperController _swiperController = CardSwiperController();

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

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
                movies: movieProvider.featuredMovies,
                controller: _carouselController,
              ),
              const SizedBox(height: 30),
              TrendingSection(movies: movieProvider.trendingMovies),
              const SizedBox(height: 30),
              const LikedMoviesSection(),
              const SizedBox(height: 30),
              const DislikedMoviesSection(),
              const SizedBox(height: 20),
              MovieSwiper(
                movies: movieProvider.trendingMovies,
                controller: _swiperController,
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
