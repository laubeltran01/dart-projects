import 'package:moovies_api/model/movie.dart';
import 'package:moovies_api/moovies_api.dart';

class MoviesController extends ResourceController {
  MoviesController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllMovies() async {
    final query = Query<Movie>(context);
    final movies = await query.fetch();

    if (movies.isEmpty) {
      return Response.noContent();
    }
    return Response.ok(movies);
  }

  @Operation.get('id')
  Future<Response> getMovieById(@Bind.path('id') int id) async {
    final query = Query<Movie>(context)..where((movie) => movie.id).equalTo(id);
    final movie = await query.fetchOne();

    if (movie == null) {
      return Response.notFound(body: '$noResourceFoundResponseMessage $id');
    }
    return Response.ok(movie);
  }

  @Operation.post()
  Future<Response> addMovie(@Bind.body(require: ['id', 'title', 'director', 'year']) Movie requestMovie) async {
    final query = Query<Movie>(context)..values = requestMovie;
    final insertedMovie = await query.insert();

    return Response.created('', body: 'Successfully created movie with ID: ${insertedMovie.id}');
  }

  // According to MDN Web Docs, the PUT method 'replaces all current representations of the target resource with the request payload',
  // that's why here we are requiring all of the movie data (title, director and year) in order to update the whole entity.
  @Operation.put('id')
  Future<Response> updateMovie(
   @Bind.path('id') int id,
   @Bind.body(ignore: ['id'], require: ['title', 'director', 'year']) Movie requestMovie
   ) async {
    final query = Query<Movie>(context)
      ..values = requestMovie
      ..where((movie) => movie.id).equalTo(id);
    final updatedMovie = await query.updateOne();

    if (updatedMovie == null) {
      return Response.notFound(body: '$noResourceFoundResponseMessage $id');
    }
    return Response.ok('Successfully updated movie with ID: ${updatedMovie.id}');
  }

  // According to MDN Web Docs, the PATCH method 'is used to apply partial modifications to a resource',
  // that's why here we are not requiring all of the movie data, so that the client is able to send through the payload
  // only the fields that they want to update
  @Operation('PATCH', 'id')
  Future<Response> patchMovie(@Bind.path('id') int id, @Bind.body(ignore: ['id']) Movie requestMovie) async {
    final query = Query<Movie>(context)
      ..values = requestMovie
      ..where((movie) => movie.id).equalTo(id);
    final patchedMovie = await query.updateOne();

    if (patchedMovie == null) {
      return Response.notFound(body: '$noResourceFoundResponseMessage $id');
    }
    return Response.ok('Successfully patched movie with ID: ${patchedMovie.id}');
  }

  @Operation.delete('id')
  Future<Response> deleteMovie(@Bind.path('id') int id) async {
    final query = Query<Movie>(context)
      ..where((movie) => movie.id).equalTo(id);
    final deletedRowsCount = await query.delete();

    if (deletedRowsCount == 0) {
      return Response.notFound(body: '$noResourceFoundResponseMessage $id');
    }
    return Response.ok('Successfully deleted movie with ID: $id');
  }
}

const String noResourceFoundResponseMessage = 'No movie found with ID:';