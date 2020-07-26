import 'package:moovies_api/controller/movies_controller.dart';
import 'package:moovies_api/moovies_api_configuration.dart';
import 'moovies_api.dart';

class MooviesApiChannel extends ApplicationChannel {
  ManagedContext context;

  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print('$rec ${rec.error ?? ''} ${rec.stackTrace ?? ''}'));

    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final config = MooviesAPIConfiguration(options.configurationFilePath);
    final database = PostgreSQLPersistentStore.fromConnectionInfo(
        config.database.username,
        config.database.password,
        config.database.host,
        config.database.port,
        config.database.databaseName);

    context = ManagedContext(dataModel, database);
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router.route('/movies/[:id]')
     .link(() => MoviesController(context));

    return router;
  }
}
