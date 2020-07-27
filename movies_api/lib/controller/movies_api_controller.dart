import 'package:aqueduct/aqueduct.dart';
import 'package:movies_api/movies_api.dart';
import 'package:movies_api/model/movie.dart';

class movies_apiController extends ResourceController {
  //Mock database to test functionality
  /*final _movies_api = [
    {'id': 1, 'title': 'Inception', 'author': 'Christopher Nolan', 'year': 2004},
    {'id': 2,'title': 'The X-files', 'author': 'Chris Carter', 'year': 2008},
    {'id': 3,'title': 'The Lion King', 'author': 'Disney', 'year': 2004},    
  ];
  */

  movies_apiController(this.context);
  ManagedContext context;

  //Different operations included in resource controller
  //GET all movies
  @Operation.get()
  Future<Response> getAllMovies() async {
    final query = Query<Movies>(context);
    final allMovies = await query.fetch();
    
    return Response.ok(allMovies);
  }
  
  //GET a movie with a specific ID
  @Operation.get('id') 
  Future<Response> getMovieByID(@Bind.path('id') int id) async {
      
      final reqMovie = await context.fetchObjectWithID<Movies>(id);
     
      if (reqMovie == null) {
        return Response.notFound();
      }

      return Response.ok(reqMovie);
    }

  //POST (add) a new movie into database
  @Operation.post()
  Future<Response> addMovie(@Bind.body(ignore: ['id']) Movies newMovie) async {
      final query = Query<Movies>(context)
        ..values = newMovie;

      String title = newMovie.title;
      int year = newMovie.year;
        
      final movieAdded = await query.insert();
      
      return Response.ok('Movie: $title ($year) was added successfully');
    }

  //PUT (update) an existing movie in the database
  @Operation.put('id')
  Future<Response> updateMovie(@Bind.path('id') int id ,@Bind.body(ignore: ['id']) Movies putMovie) async {
      final query = Query<Movies>(context)
        ..values = putMovie
        ..where((u) => u.id).equalTo(id);

      var updatedMovie = await query.update();

      return Response.ok('Movie with id $id was updated');
    }
  

  //DELETE an existing movie from database
  @Operation.delete('id')
  Future<Response> deleteMovie(@Bind.path('id') int id) async {
      final query = Query<Movies>(context)
        ..where((u) => u.id).equalTo(id);
      
      int moviesDeleted = await query.delete();

      return Response.ok('$moviesDeleted movie(s) deleted');
      
    }  
  }