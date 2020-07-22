import 'package:blockbuster/blockbuster.dart';

class Movie extends ManagedObject<_Movie> implements _Movie {}

class _Movie {
  @primaryKey
  int id;
  @Column(unique: true, indexed: true)
  String title;
  @Column(unique: false)
  String director;
  @Column(unique: false)
  int year;
}
