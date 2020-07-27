import 'movies_api.dart';
import 'controller/movies_api_controller.dart';

class MyConfiguration extends Configuration {
  MyConfiguration(String configPath) : super.fromFile(File(configPath));

  DatabaseConfiguration database;
}

class MoviesApiChannel extends ApplicationChannel {
  ManagedContext context;

  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    
    final config = MyConfiguration(options.configurationFilePath);
    var dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    
    //Postgres DB configuration from file
    var psc = PostgreSQLPersistentStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databaseName);

    context = ManagedContext(dataModel, psc);
    
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router
      .route('/movies_api/[:id]')
      .link(() => movies_apiController(context));
    
    
    router
      .route("/example")
      .linkFunction((request) async {
        return Response.ok({"key": "value"});
      });

    return router;
  }
}