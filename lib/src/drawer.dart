import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/movies.dart';

class MovieDrawer extends StatefulWidget {
  const MovieDrawer({super.key});

  @override
  State<MovieDrawer> createState() => _MovieDrawerState();
}

class _MovieDrawerState extends State<MovieDrawer> {
  late MoviesBloc moviesBloc;

  @override
  void initState() {
    super.initState();
    moviesBloc = context.read<MoviesBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ListTile(
              leading: const Icon(Icons.add_sharp),
              title: const Text('SUCCESS EVENT'),
              onTap: () {
                moviesBloc.loadMovie(arguments: <String, dynamic>{
                  'adult': false,
                  'backdrop_path': '/tElnmtQ6yz1PjN1kePNl8yMSb59.jpg',
                  'genres': [
                    {
                      'id': 16,
                      'name': 'Animation'
                    },
                    {
                      'id': 12,
                      'name': 'Adventure'
                    },
                    {
                      'id': 10751,
                      'name': 'Family'
                    },
                    {
                      'id': 35,
                      'name': 'Comedy'
                    }
                  ],
                  'cast': [
                    {
                      'adult': false,
                      'gender': 1,
                      'id': 1564846,
                      'known_for_department': 'Acting',
                      'name': 'Auli\'i Cravalho',
                      'original_name': 'Auli\'i Cravalho',
                      'popularity': 35.452,
                      'profile_path': '/vEroqcnM2g6yY7qXDAie7hx2Cyp.jpg',
                      'cast_id': 19,
                      'character': 'Moana (voice)',
                      'credit_id': '65c7a9bdaad9c20164b6234e',
                      'order': 0
                    },
                    {
                      'adult': false,
                      'gender': 2,
                      'id': 18918,
                      'known_for_department': 'Acting',
                      'name': 'Dwayne Johnson',
                      'original_name': 'Dwayne Johnson',
                      'popularity': 82.316,
                      'profile_path': '/5QApZVV8FUFlVxQpIK3Ew6cqotq.jpg',
                      'cast_id': 18,
                      'character': 'Maui (voice)',
                      'credit_id': '65c6293894d8a80162127124',
                      'order': 1
                    },
                    {
                      'adult': false,
                      'gender': 0,
                      'id': 4775908,
                      'known_for_department': 'Acting',
                      'name': 'Hualālai Chung',
                      'original_name': 'Hualālai Chung',
                      'popularity': 4.801,
                      'profile_path': '/x2g5fdHqETY9dZgL4aB0QDP0boR.jpg',
                      'cast_id': 58,
                      'character': 'Moni (voice)',
                      'credit_id': '666cf3450000000000831f0a',
                      'order': 2
                    },
                    {
                      'adult': false,
                      'gender': 1,
                      'id': 1868823,
                      'known_for_department': 'Acting',
                      'name': 'Rose Matafeo',
                      'original_name': 'Rose Matafeo',
                      'popularity': 4.846,
                      'profile_path': '/zQa39fMjbOTIsovbh1TBTJVlToz.jpg',
                      'cast_id': 56,
                      'character': 'Loto (voice)',
                      'credit_id': '666cf2ed675ceb4d14597a3b',
                      'order': 3
                    },
                    {
                      'adult': false,
                      'gender': 2,
                      'id': 55937,
                      'known_for_department': 'Acting',
                      'name': 'David Fane',
                      'original_name': 'David Fane',
                      'popularity': 2.752,
                      'profile_path': '/tcozyaTgAa8rRmzc5qeht0loni6.jpg',
                      'cast_id': 57,
                      'character': 'Kele (voice)',
                      'credit_id': '666cf2fb6115e8a7f1843b3c',
                      'order': 4
                    },
                    {
                      'adult': false,
                      'gender': 0,
                      'id': 5076341,
                      'known_for_department': 'Acting',
                      'name': 'Bentley Pupuhi-Fernandez',
                      'original_name': 'Bentley Pupuhi-Fernandez',
                      'popularity': 0.857,
                      'profile_path': null,
                      'cast_id': 76,
                      'character': 'Additional Voices (voice)',
                      'credit_id': '674156f84a3dc178173d4ecb',
                      'order': 5
                    }
                  ],
                  'id': 1241982,
                  'original_language': 'en',
                  'original_title': 'Moana 2',
                  'overview': 'After receiving an unexpected call from her wayfinding ancestors, Moana journeys alongside Maui and a new '
                      'crew to the far seas of Oceania and into dangerous, long-lost waters for an adventure unlike anything she\'s ever faced.',
                  'popularity': 2595.191,
                  'poster_path': '/4YZpsylmjHbqeWzjKpUEF8gcLNW.jpg',
                  'release_date': '2024-11-27',
                  'title': 'Moana 2',
                  'video': false,
                  'vote_average': 7.2,
                  'vote_count': 72
                });
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }
}
