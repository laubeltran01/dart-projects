import 'package:aqueduct/aqueduct.dart';
import 'package:pj/model/movie.dart';

class MoviesController extends ResourceController {
  MoviesController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllHeroes() async {
    final query = Query<Movie>(context);
    return Response.ok(await query.fetch());
  }

  @Operation.get('id')
  Future<Response> getHeroByID(@Bind.path('id') int id) async {
    final query = Query<Movie>(context)..where((h) => h.id).equalTo(id);
    final movie = await query.fetchOne();
    if (movie == null) {
      return Response.notFound();
    }
    return Response.ok(movie);
  }

  @Operation.post()
  Future<Response> createMovie(
      @Bind.body(ignore: ['id']) Movie newMovie) async {
    final query = Query<Movie>(context)..values = newMovie;
    return Response.ok(await query.insert());
  }

  @Operation.put('id')
  Future<Response> updateMovie(@Bind.path('id') int id,
      @Bind.body(ignore: ['id']) Movie modifyMovie) async {
    final query = Query<Movie>(context)
      ..values = modifyMovie
      ..where((movie) => movie.id).equalTo(id);
    final updatedMovie = await query.updateOne();
     if (updatedMovie == null) {
      return Response.notFound();
    }
    return Response.ok(updatedMovie);
  }

  @Operation.delete('id')
  Future<Response> deleteMovie(@Bind.path('id') int id) async {
    final query = Query<Movie>(context)..where((movie) => movie.id).equalTo(id);
    final movie = query.delete();
    if (movie == null) {
      return Response.notFound();
    }
    return Response.ok(movie);
  }
}
