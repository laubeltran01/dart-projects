import 'package:blockbuster/blockbuster.dart';
import 'package:blockbuster/model/movie.dart';

class MoviesController extends ResourceController {
  MoviesController(this.context);

  ManagedContext context;

  @Operation.get()
  Future<Response> getAllMovies() async {
    final query = Query<Movie>(context);
    final movieList = await query.fetch();

    return Response.ok(movieList);
  }

  @Operation.get('id')
  Future<Response> getMovie(@Bind.path('id') int id) async {
    final query = Query<Movie>(context)..where((movie) => movie.id).equalTo(id);
    final movie = await query.fetchOne();
    return Response.ok(movie);
  }

  @Operation.post()
  Future<Response> addMovie(@Bind.body(ignore: ['id']) Movie newMovie) async {
    final query = Query<Movie>(context)..values = newMovie;
    final insertedWord = await query.insert();
    return Response.ok(insertedWord);
  }

  @Operation.put('id')
  Future<Response> updateMovie(@Bind.path('id') int id,
      @Bind.body(ignore: ['id']) Movie modifyMovie) async {
    final query = Query<Movie>(context)
      ..values = modifyMovie
      ..where((movie) => movie.id).equalTo(id);
    final updatedMovie = await query.updateOne();
    return Response.ok(updatedMovie);
  }

  @Operation.delete('id')
  Future<Response> deleteMovie(@Bind.path('id') int id) async {
    final query = Query<Movie>(context)..where((movie) => movie.id).equalTo(id);
    final movieDeleted = query.delete();
    final message = {'message': 'Deleted movie'};
    return Response.ok(message);
  }
}
