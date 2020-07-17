import 'package:movies_api/controller/movies_controller.dart';

import 'movies_api.dart';

class AppConfiguration extends Configuration {
  AppConfiguration.fromFile(File file) : super.fromFile(file);

  DatabaseConfiguration database;
}

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class MoviesApiChannel extends ApplicationChannel {
  ManagedContext context;

  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final config =
        AppConfiguration.fromFile(File(options.configurationFilePath));
    final db = config.database;

    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
        db.username, db.password, db.host, db.port, db.databaseName);
    context = ManagedContext(
        ManagedDataModel.fromCurrentMirrorSystem(), persistentStore);
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

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });

    router.route("/movies/[:id]").link(() => MoviesController(context));

    return router;
  }
}
