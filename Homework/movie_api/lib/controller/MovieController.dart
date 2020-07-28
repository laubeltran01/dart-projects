import 'package:movie_api/model/model.dart';

import '../movie_api.dart';

class MovieController extends ManagedObjectController<Movie> {
  ManagedContext context;

  MovieController(ManagedContext context) : super(context){
    this.context = context;
  }

  @Operation("PATCH", "id")
  Future<Response> patchObject(@Bind.path("id") String id) async {
    var _query = Query<Movie>(context);
    var primaryKey = _query.entity.primaryKey;
    final parsedIdentifier = int.parse(id);
    _query.where((o) => o[primaryKey]).equalTo(parsedIdentifier);

    Movie instance = _query.entity.instanceType
        .newInstance(const Symbol(""), []).reflectee as Movie;
    instance.readFromMap(request.body.as());
    _query.values = instance;

    _query = await willUpdateObjectWithQuery(_query);

    var results = await _query?.updateOne();
    if (results == null) {
      return didNotFindObjectToUpdateWithID(id);
    } else {
      return didUpdateObject(results);
    }
  }

}