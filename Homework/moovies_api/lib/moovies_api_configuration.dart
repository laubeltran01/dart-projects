import 'package:moovies_api/moovies_api.dart';

class MooviesAPIConfiguration extends Configuration {
	MooviesAPIConfiguration(String fileName) : super.fromFile(File(fileName));

	DatabaseConfiguration database;
}