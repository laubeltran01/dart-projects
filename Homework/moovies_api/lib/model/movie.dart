import 'package:moovies_api/moovies_api.dart';

class Movie extends ManagedObject<_Movie> implements _Movie {}

class _Movie {
	@primaryKey
	int id;

	@Column()
	String title;
	@Column()
	String director;
	@Column()
	int year;
}