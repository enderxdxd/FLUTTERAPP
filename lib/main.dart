import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_signup/screens/welcome_screen.dart';
import 'package:login_signup/theme/theme.dart';  // Verify the correct path
import 'models/movie.dart';
import 'models/movie_list_view.dart';
import 'models/movie_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,  // Assuming lightMode is defined in your theme file
      home: WelcomeScreen(),  // Starting screen of your app
      routes: {
        '/movieExplorer': (context) => MovieExplorerHomePage(),  // Route to the movie explorer
      },
    );
  }
}

class MovieExplorerHomePage extends StatefulWidget {
  @override
  _MovieExplorerHomePageState createState() => _MovieExplorerHomePageState();
}

class _MovieExplorerHomePageState extends State<MovieExplorerHomePage> {
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    try {
      movies = await MovieService.fetchMovies();
      setState(() {});
    } catch (e) {
      print('Error fetching movies: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Explorer'),
      ),
      body: movies.isEmpty
          ? Center(child: CircularProgressIndicator())
          : MovieListView(movies: movies),
    );
  }
}
