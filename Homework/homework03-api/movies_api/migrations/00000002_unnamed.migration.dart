import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import 'package:movies_api/models/movie.dart';

class Migration2 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(SchemaTable("_Movie", [
      SchemaColumn("id", ManagedPropertyType.bigInteger,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("title", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: true,
          isNullable: false,
          isUnique: true),
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
    var movies = [
      {'title': 'Inception', 'author': 'Christopher Nolan', 'year': 2004},
      {'title': 'The X-files', 'author': 'Chris Carter', 'year': 2008},
      {'title': 'The Lion King', 'author': 'Disney', 'year': 2004},
    ];

    for (final movie in movies) {
      await database.store.execute(
          'INSERT INTO _Movie(title, author, year) VALUES(@title, @author, @year)',
          substitutionValues: {
            'title': movie['title'],
            'author': movie['author'],
            'year': movie['year']
          });
    }
  }
}
