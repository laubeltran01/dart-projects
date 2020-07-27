import 'package:movies_api/movies_api.dart';

class Movies extends ManagedObject<_Movies> implements _Movies {}

class _Movies {
  @primaryKey
  int id;

  @Column(indexed: true)
  String title;
  String director;
  int year;
}