import 'package:movies_api/models/movie.dart';

import '../movies_api.dart';

class MoviesController extends ResourceController {
  MoviesController(this.context);

  ManagedContext context;

  @Operation.get()
  Future<Response> getMovies() async {
    final query = Query<Movie>(context);
    final movies = await query.fetch();
    return Response.ok(movies);
  }

  @Operation.get('id')
  Future<Response> getMovie(@Bind.path("id") int id) async {
    final query = Query<Movie>(context)..where((p) => p.id).equalTo(id);

    final movie = await query.fetchOne();
    return Response.ok(movie);
  }

  @Operation.post()
  Future<Response> postMovie(@Bind.body(ignore: ["id"]) Movie movie) async {
    final query = Query<Movie>(context)..values = movie;
    final newMovie = await query.insert();
    return Response.ok(newMovie);
  }

  @Operation.put('id')
  Future<Response> putMovie(
      @Bind.path("id") int id, @Bind.body(ignore: ["id"]) Movie movie) async {
    final query = Query<Movie>(context)
      ..values = movie
      ..where((i) => i.id).equalTo(id);

    final updatedMovie = await query.updateOne();
    return Response.ok(updatedMovie);
  }

  @Operation('PATCH', 'id')
  Future<Response> patchMovie(
      @Bind.path("id") int id, @Bind.body(ignore: ["id"]) Movie patch) async {
    final query = Query<Movie>(context)
      ..values = patch
      ..where((i) => i.id).equalTo(id);

    final updatedMovie = await query.updateOne();
    return Response.ok(updatedMovie);
  }

  @Operation.delete("id")
  Future<Response> deleteMovie(@Bind.path("id") int id) async {
    final query = Query<Movie>(context)..where((i) => i.id).equalTo(id);
    final movie = await query.delete();
    return Response.ok('$movie was/were deleted');
  }
}
