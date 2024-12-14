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
              title: const Text('MOVIE DETAIL'),
              onTap: () {
                moviesBloc.loadMovie(arguments: <String, dynamic>{
                  'adult': false,
                  'backdrop_path': '/tElnmtQ6yz1PjN1kePNl8yMSb59.jpg',
                  'genres': [
                    {'id': 16, 'name': 'Animation'},
                    {'id': 12, 'name': 'Adventure'},
                    {'id': 10751, 'name': 'Family'},
                    {'id': 35, 'name': 'Comedy'}
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
          ListTile(
              leading: const Icon(Icons.add_sharp),
              title: const Text('MOVIE LIST'),
              onTap: () {
                moviesBloc.getMovieList(arguments: '''[
                    {
                      "id": 912649,
                      "poster_path": "/aosm8NMQ3UyoBVpSxyimorCQykC.jpg",
                      "title": "Venom: The Last Dance",
                      "release_date": "2024-10-22",
                      "vote_average": "6.751",
                      "vote_count": 1428
                    },
                    {
                      "id": 1241982,
                      "poster_path": "/4YZpsylmjHbqeWzjKpUEF8gcLNW.jpg",
                      "title": "Moana 2",
                      "release_date": "2024-11-21",
                      "vote_average": "6.9",
                      "vote_count": 481
                    },
                    {
                      "id": 1035048,
                      "poster_path": "/uQhYBxOVFU6s9agD49FnGHwJqG5.jpg",
                      "title": "Elevation",
                      "release_date": "2024-11-07",
                      "vote_average": "6.5",
                      "vote_count": 151
                    },
                    {
                      "id": 974453,
                      "poster_path": "/cNtAslrDhk1i3IOZ16vF7df6lMy.jpg",
                      "title": "Absolution",
                      "release_date": "2024-10-31",
                      "vote_average": "6.1",
                      "vote_count": 131
                    },
                    {
                      "id": 845781,
                      "poster_path": "/cdqLnri3NEGcmfnqwk2TSIYtddg.jpg",
                      "title": "Red One",
                      "release_date": "2024-10-31",
                      "vote_average": "6.983",
                      "vote_count": 444
                    },
                    {
                      "id": 1182387,
                      "poster_path": "/pnXLFioDeftqjlCVlRmXvIdMsdP.jpg",
                      "title": "Armor",
                      "release_date": "2024-10-30",
                      "vote_average": "5.5",
                      "vote_count": 65
                    },
                    {
                      "id": 1147416,
                      "poster_path": "/6AtoMpHvs9pxd30KsyK8QmJ9W9M.jpg",
                      "title": "Miraculous World, London: At the Edge of Time",
                      "release_date": "2024-11-14",
                      "vote_average": "8.5",
                      "vote_count": 44
                    }
                  ]'''
                );
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }
}
