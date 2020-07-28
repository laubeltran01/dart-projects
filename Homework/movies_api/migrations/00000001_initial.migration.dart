import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import 'package:movies/model/movie_model.dart';

class Migration1 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(SchemaTable("MovieTable", [
      SchemaColumn("id", ManagedPropertyType.bigInteger,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("title", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("author", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("year", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false)
    ]));
  }

  @override
  Future downgrade() async {}

  @override
  Future seed() async {
    final _movies = [
      {'title': 'Inception', 'author': 'Christopher Nolan', 'year': 2004},
      {'title': 'The X-files', 'author': 'Chris Carter', 'year': 2008},
      {'title': 'The Lion King', 'author': 'Disney', 'year': 2004},
    ];

    for (final movie in _movies) {
      await database.store.execute(
          "INSERT INTO _MovieTable (title, author, year) VALUES (@title, @author, @year)",
          substitutionValues: {
            "title": movie['title'],
            "author": movie['author'],
            "year": movie['year'],
          });
    }
  }
}
