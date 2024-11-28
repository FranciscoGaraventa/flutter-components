import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/movies.dart';

class MoviesModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance(
      MoviesBloc(),
      config: BindConfig<MoviesBloc>(onDispose: (bloc) => bloc.dispose()),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const MovieDetails(),
    );
  }
}
