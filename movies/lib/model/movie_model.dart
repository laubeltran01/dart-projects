import '../movies.dart';

class Movie extends ManagedObject<_Movie> implements _Movie {

}

class _Movie {
  @primaryKey
  int id;


  @Column(unique: true, indexed: true)
  String title;
  String author;
  int year;

}