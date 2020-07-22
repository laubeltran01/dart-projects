import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration1 extends Migration {
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
      SchemaColumn("director", ManagedPropertyType.string,
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
      {'title': 'titanic', 'director': 'Leo', 'year': 2000},
      {'title': 'Mad Max', 'director': 'Australian', 'year': 2012}
    ];

    for (final row in rows)
      await database.store.execute(
          "INSERT INTO _Movie (title, director, year) VALUES (@title, @director, @year)",
          substitutionValues: {
            "title": row['title'],
            "director": row['director'],
            "year": row['year']
          });
  }
}
