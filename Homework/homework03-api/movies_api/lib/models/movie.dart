import '../movies_api.dart';

class _Movie {
  @primaryKey
  int id;

  @Column(unique: true, indexed: true)
  String title;
  @Column()
  String author;
  @Column()
  int year;
}

class Movie extends ManagedObject<_Movie> implements _Movie {}
