import 'movies.dart';
import './controller/movies_controller.dart';

class MyConfiguration extends Configuration {
  MyConfiguration(String configPath) : super.fromFile(File(configPath));

  DatabaseConfiguration database;
}

class MoviesChannel extends ApplicationChannel {
  ManagedContext context;

  @override
  Future prepare() async {
    final config = MyConfiguration(options.configurationFilePath);
    var dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    var psc = PostgreSQLPersistentStore.fromConnectionInfo(
        config.database.username,
        config.database.password,
        config.database.host,
        config.database.port,
        config.database.databaseName);
    context = ManagedContext(dataModel, psc);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    router.route('/movies/[:id]').link(() => MoviesController(context));

    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });

    return router;
  }
}
