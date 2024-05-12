import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'movie.dart';
import '../api_config.dart'; // Ensure this import is correct for accessing ApiConfig

class MovieListView extends StatelessWidget {
  final List<Movie> movies;

  const MovieListView({required this.movies, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return ListTile(
          leading: CachedNetworkImage(
            imageUrl: '${ApiConfig.imageBaseUrl}${movie.posterPath}',
            width: 60,
            height: 90,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          title: Text(movie.title),
          subtitle: Text(movie.overview),
          trailing: Text('Rating: ${movie.voteAverage.toStringAsFixed(1)}'),
        );
      },
    );
  }
}
