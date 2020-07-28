import 'package:movies/movies.dart';

@Table(name: "MovieTable")
class _Movie {
  @primaryKey
  int id;

  String title;

  String author;

  int year;
}

class Movie extends ManagedObject<_Movie> implements _Movie {
  
}