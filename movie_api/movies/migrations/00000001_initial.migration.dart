import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration1 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(SchemaTable("_MovieModel", [
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
    final rows = [
      {'title': 'Inception', 'author': 'Christopher Nolan', 'year': 2004},
      {'title': 'The X-files', 'author': 'Chris Carter', 'year': 2008},
      {'title': 'The Lion King', 'author': 'Disney', 'year': 2004}
    ];
    for (final row in rows) {
      await database.store.execute(
          "INSERT INTO _MovieModel (title, author, year) VALUES (@title, @author, @year)",
          substitutionValues: {
            "title": row['title'],
            "author": row['author'],
            "year": row['year']
          });
    }
  }
}
