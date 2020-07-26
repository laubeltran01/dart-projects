import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import 'package:moovies_api/model/movie.dart';

class Migration1 extends Migration {
  @override
  Future upgrade() async {
    final moviesTable = SchemaTable('_movie', [
      SchemaColumn('id', ManagedPropertyType.bigInteger, isPrimaryKey: true),
      SchemaColumn('title', ManagedPropertyType.string),
      SchemaColumn('director', ManagedPropertyType.string),
      SchemaColumn('year', ManagedPropertyType.integer)
    ]);

    database.createTable(moviesTable);
  }

  @override
  Future downgrade() async {}

  @override
  Future seed() async {
    const timeout = 10;
    final dataset = [
      {'id': 1, 'title': 'Inception', 'director': 'Christopher Nolan', 'year': 2004},
      {'id': 2, 'title': 'The X-files', 'director': 'Chris Carter', 'year': 2008},
      {'id': 3, 'title': 'The Lion King', 'director': 'Disney', 'year': 2004},
    ];

    for (var i = 0; i < dataset.length; i++) {
      await store.executeQuery(
       'INSERT INTO _movie (id, title, director, year) VALUES (@id, @title, @director, @year)',
       dataset[i],
       timeout);
    }
  }
}