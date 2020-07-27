import 'package:aqueduct/aqueduct.dart';
import 'package:movies/movies.dart';
import 'package:movies/model/movie_model.dart';

class MoviesController extends ResourceController {
  MoviesController(this.context);
  final ManagedContext context;

  //invoked for GET /movies
  @Operation.get()
  Future<Response> getAllMovies() async {
    final query = Query<MovieModel>(context);

    return Response.ok(await query.fetch());
  }

  //Invoked for GET /movies[:id]
  @Operation.get('id')
  Future<Response> getMovieByID(@Bind.path('id') int id) async {
    final query = Query<MovieModel>(context)..where((x) => x.id).equalTo(id);
    final movie = await query.fetchOne();

    if (movie == null) {
      return Response.notFound(body: 'Movie doesnt exist');
    }

    return Response.ok(movie);
  }

  //Invoked for POST /movies
  @Operation.post()
  Future<Response> createMovie(
      @Bind.body(ignore: ['id']) MovieModel newMovie) async {
    final query = Query<MovieModel>(context)..values = newMovie;
    return Response.ok(await query.insert());
  }

  // @Operation.post()
  // Future<Response> createMovie(@Bind.body() MovieModel newMovie) async {
  //   final insertedMovie = await context.insertObject(newMovie);

  //   return Response.ok(insertedMovie);
  // }

  //Invoked for PUT /movies[:id]
  @Operation.put('id')
  Future<Response> replaceMovie(@Bind.path('id') int id,
      @Bind.body(ignore: ['id']) MovieModel putMovie) async {
    final query = Query<MovieModel>(context)
      ..values = putMovie
      ..where((x) => x.id).equalTo(id);

    final updatedMovie = await query.updateOne();

    if (updatedMovie == null) {
      return Response.notFound(body: 'Movie doesnt exist');
    }
    return Response.ok(updatedMovie);
  }

  //Invoked for PATH /movies[:id]
  @Operation('PATCH', 'id')
  Future<Response> updateMovie(@Bind.path('id') int id,
      @Bind.body(ignore: ['id']) MovieModel patchMovie) async {
    final query = Query<MovieModel>(context)
      ..values = patchMovie
      ..where((x) => x.id).equalTo(id);

    final patchedMovie = await query.updateOne();

    return Response.ok(patchedMovie);
  }

  //Invoked for DELETE /movies[:id]
  @Operation.delete('id')
  Future<Response> deleteMovie(@Bind.path('id') int id) async {
    final query = Query<MovieModel>(context)..where((x) => x.id).equalTo(id);
    final deletedMovieId = await query.delete();

    if (deletedMovieId == 0) {
      return Response.notFound(body: 'Movie doesnt exists');
    }
    return Response.ok('Successfully deleted movie');
  }
}
