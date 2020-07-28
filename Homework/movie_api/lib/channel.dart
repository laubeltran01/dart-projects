import 'controller/MovieController.dart';
import 'movie_api.dart';

class MovieApiChannel extends ApplicationChannel {
  ManagedContext context;

  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final config = MovieApiConfiguration(options.configurationFilePath);
    context = contextWithConnectionInfo(config.database);
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router.route("/model/[:id]").link(() => MovieController(context));

    return router;
  }

  ManagedContext contextWithConnectionInfo(DatabaseConfiguration connectionInfo) {
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final psc = PostgreSQLPersistentStore(connectionInfo.username, connectionInfo.password, connectionInfo.host,
        connectionInfo.port, connectionInfo.databaseName);

    return ManagedContext(dataModel, psc);
  }
}

class MovieApiConfiguration extends Configuration {
  MovieApiConfiguration(String fileName) : super.fromFile(File(fileName));

  DatabaseConfiguration database;
}
