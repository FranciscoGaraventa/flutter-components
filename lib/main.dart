import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_components/src/drawer.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/movies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (_) {
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: MoviesModule(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Movies',
        home: Scaffold(
          drawer: MovieDrawer() ,
          body: MoviesView(),
        ),
      ),
    );
  }
}
