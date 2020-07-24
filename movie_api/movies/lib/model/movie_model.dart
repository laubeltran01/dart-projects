import 'package:movies/movies.dart';

class MovieModel extends ManagedObject<_MovieModel> implements _MovieModel {}

class _MovieModel {
  @primaryKey
  int id;

  @Column(unique: true, indexed: true)
  String title;
  String author;
  int year;
}
