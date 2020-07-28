import '../movie_api.dart';

class Movie extends ManagedObject<_Movie> implements _Movie{}

class _Movie {
  @primaryKey int id;
  String title;
  String author;
  int year;
}
