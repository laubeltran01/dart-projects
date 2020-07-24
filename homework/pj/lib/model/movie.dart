import 'package:aqueduct/aqueduct.dart';

class Movie extends ManagedObject<_Movie> implements _Movie {}

class _Movie {
  @primaryKey
  int id;
  @Column(unique: true, indexed: true)
  String title;
  @Column(unique: false)
  String author;
  @Column(unique: false)
  int year;
}