import 'package:movies/model/movie_model.dart';
import 'package:movies/movies.dart';

class MoviesController extends ResourceController {
  // Constructor to initialize the context
  MoviesController(this.context);
  ManagedContext context;
// invoke for GET /movies
  @Operation.get()
  Future<Response> readAllMovies() async {
    final query = Query<MovieModel>(context);
    final movieList = await query.fetch();

    return Response.ok(movieList);
  }

// invoke for GET /movies/[:id]
  @Operation.get('id')
  Future<Response> readMoviesbyId(@Bind.path('id') int id) async {
    final query = Query<MovieModel>(context)..where((x) => x.id).equalTo(id);
    final word = await query.fetchOne();
    if (word == null) {
      return Response.notFound();
    }
    return Response.ok(word);
  }

  // invoke for POST /movies
  @Operation.post()
  Future<Response> createMovie(
      @Bind.body(ignore: ['id']) MovieModel newMovie) async {
    final query = Query<MovieModel>(context)..values = newMovie;
    final insertedMovie = await query.insert();

    return Response.ok(insertedMovie);
  }

  // invoke for PUT /movies/[:id]
  @Operation.put('id')
  Future<Response> replaceMovie(@Bind.path('id') int id,
      @Bind.body(ignore: ['id']) MovieModel putMovie) async {
    final query = Query<MovieModel>(context)
      ..values = putMovie
      ..where((x) => x.id).equalTo(id);
    final replacedMovie = await query.updateOne();

    return Response.ok(replacedMovie);
  }

  // invoke for PATCH /movies/[:id]
  @Operation('PATCH', 'id')
  Future<Response> updateMovie(@Bind.path('id') int id,
      @Bind.body(ignore: ['id']) MovieModel patchMovie) async {
    final query = Query<MovieModel>(context)
      ..values = patchMovie
      ..where((x) => x.id).equalTo(id);
    final updatedMovie = await query.updateOne();
    return Response.ok(updatedMovie);
  }

// invoke for delete /movies/[:id]
  @Operation.delete('id')
  Future<Response> deleteMovie(@Bind.path('id') int id) async {
    final query = Query<MovieModel>(context)..where((x) => x.id).equalTo(id);
    final deletedMovie = await query.delete();
    final deletedMessage = {'message': 'Deleted $deletedMovie movie(s)'};
    return Response.ok(deletedMessage);
  }
}
