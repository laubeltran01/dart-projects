import 'package:aqueduct/aqueduct.dart';
import 'package:movies/model/movie_model.dart';
import 'package:movies/movies.dart';

class MoviesController extends ResourceController {
  MoviesController(this.context);

  ManagedContext context;

  @Operation.get()
  Future<Response> getAllMovies() async {
    final movieQuery = Query<Movie>(context);
    final dataBaseMovies = await movieQuery.fetch();

    return Response.ok(dataBaseMovies);
  }

  @Operation.get('id')
  Future<Response> getAllHeroByID(@Bind.path('id') int id) async {
    final movieQuery = Query<Movie>(context)..where((movie) => movie.id == id);
    final movie = await movieQuery.fetchOne();

    if (movie == null) {
      return Response.notFound();
    }
    return Response.ok(movie);
  }
}
