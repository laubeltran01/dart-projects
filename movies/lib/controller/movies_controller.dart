import 'package:movies/movies.dart';
import '../model/movie_model.dart';
import 'package:aqueduct/aqueduct.dart';

class MoviesController extends ResourceController {

  ManagedContext context;
  MoviesController(this.context);


  @Operation.get()
  Future<Response> getAllMovies() async {
    final query = Query<Movie>(context);
    final moviesList = await query.fetch();
    return Response.ok(moviesList);
  }

  @Operation.get('id')
  Future<Response> getMovieByID(@Bind.path('id') int id) async {
    final query = Query<Movie>(context);
    query.where((item) => item.id).equalTo(id);
    final movie = await query.fetchOne();
    if (movie == null) {
      return Response.notFound();
    }
    return Response.ok(movie);
  }

  @Operation.post()
  Future<Response> createMovie(@Bind.body(ignore: ['id']) Movie newMovie) async {
    final query = Query<Movie>(context);
    query.values = newMovie;
    final insertMovie = await query.insert();
    return Response.ok(insertMovie);
  }

  @Operation.put('id')
  Future<Response> replaceMovie(@Bind.path('id') int id, @Bind.body(ignore: ['id']) Movie putMovie) async {
    final query = Query<Movie>(context);
    query.values = putMovie;
    query.where((item) => item.id).equalTo(id);
    final replaceMovie = await query.updateOne();
    return Response.ok(replaceMovie);
  }

  @Operation('PATCH','id')
  Future<Response> updateMovie(@Bind.path('id') int id, @Bind.body(ignore: ['id']) Movie patchMovie) async {
    final query = Query<Movie>(context);
    query.values = patchMovie;
    query.where((item) => item.id).equalTo(id);
    final replaceMovie = await query.updateOne();
    return Response.ok(replaceMovie);
  }

  @Operation.delete('id')
  Future<Response> deleteMovie(@Bind.path('id') int id) async {
    final query = Query<Movie>(context);
    query.where((item) => item.id).equalTo(id);
    final deleteMovie = await query.delete();
    final deleteMessage = {'menassage': 'Delete $deleteMovie movie'};
    return Response.ok(deleteMessage);
  }



}
