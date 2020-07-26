import 'package:moovies_api/model/movie.dart';
import 'harness/app.dart';

Future main() async {
  final harness = Harness()..install();

  // Test that GET method returns a 200 and a correct response
  // body when there is one movie stored in the database
  test('GET /movies returns 200', () async {
    await _insertTestMovie(harness.application.channel.context);
    final response = await harness.agent.get('/movies');

    expectResponse(response, 200, body: allOf([
      hasLength(greaterThan(0)),
      everyElement({
        'id': greaterThan(0),
        'title': isString,
        'director': isString,
        'year': greaterThan(0)
      })
    ]));
  });

  // Test that GET method returns a 204 when there are no movies
  // stored in the database
  test('GET /movies returns 204', () async {
    final response = await harness.agent.get('/movies');
    expectResponse(response, 204);
  });

  // Test that GET method returns a 200 and a correct response
  // body when querying an existing movie through the URL path
  test('GET /movies/$testMovieId returns 200', () async {
    await _insertTestMovie(harness.application.channel.context);
    final response = await harness.agent.get('/movies/$testMovieId');

    expectResponse(response, 200, body: {
        'id': testMovieId,
        'title': testMovieTitle,
        'director': testMovieDirector,
        'year': testMovieYear
      });
  });

  // Test that GET method returns a 404 and a correct response
  // body when querying a non-existing movie through the URL path
  test('GET /movies/$nonExistingTestMovieId returns 404', () async {
    await _insertTestMovie(harness.application.channel.context);
    final response = await harness.agent.get('/movies/$nonExistingTestMovieId');

    expectResponse(response, 404, body: 'No movie found with ID: $nonExistingTestMovieId');
  });

  // Test that POST method returns a 400 when trying to
  // create a movie with an incorrect payload
  test('POST /movies returns 400', () async {
    final payload = Movie()
      ..director = testMovieDirector;
    final response = await harness.agent.post('/movies', body: payload.asMap());

    expectResponse(response, 400);
  });

  // Test that POST method returns a 409 when trying to
  // create a movie with an ID that already exists in the database
  test('POST /movies returns 409', () async {
    await _insertTestMovie(harness.application.channel.context);
    final payload = Movie()
      ..id = testMovieId
      ..title = testMovieTitle
      ..director = testMovieDirector
      ..year = testMovieYear;
    final response = await harness.agent.post('/movies', body: payload.asMap());

    expectResponse(response, 409);
  });

  // Test that POST method returns a 201 when trying to
  // create a movie with an ID that doesn't exist in the database
  test('POST /movies returns 201', () async {
    final payload = Movie()
      ..id = testMovieId
      ..title = testMovieTitle
      ..director = testMovieDirector
      ..year = testMovieYear;
    final response = await harness.agent.post('/movies', body: payload.asMap());

    expectResponse(response, 201);
  });

  // Test that PUT method returns a 400 when trying to
  // update a movie with an incorrect payload
  test('PUT /movies/$testMovieId returns 400', () async {
    final payload = Movie()
      ..director = testMovieDirector;
    final response = await harness.agent.put('/movies/$testMovieId', body: payload.asMap());

    expectResponse(response, 400);
  });

  // Test that PUT method returns a 404 and correct
  // response body when trying to update a movie
  // that doesn't exist in the database
  test('PUT /movies/$testMovieId returns 404', () async {
    final payload = Movie()
      ..id = testMovieId
      ..title = testMovieTitle
      ..director = testMovieDirector
      ..year = testMovieYear;
    final response = await harness.agent.put('/movies/$testMovieId', body: payload.asMap());

    expectResponse(response, 404, body: 'No movie found with ID: $testMovieId');
  });

  // Test that PUT method returns a 200 and correct
  // response body when trying to update a movie
  // that exists in the database
  test('PUT /movies/$testMovieId returns 200', () async {
    await _insertTestMovie(harness.application.channel.context);
    final payload = Movie()
      ..id = testMovieId
      ..title = testMovieTitle
      ..director = testMovieDirector
      ..year = testMovieYear;
    final response = await harness.agent.put('/movies/$testMovieId', body: payload.asMap());

    expectResponse(response, 200, body: 'Successfully updated movie with ID: $testMovieId');
  });
}

Future<void> _insertTestMovie(ManagedContext context) async {
  final query = Query<Movie>(context)
    ..values.id = testMovieId
    ..values.title = testMovieTitle
    ..values.director = testMovieDirector
    ..values.year = testMovieYear;

  await query.insert();
}

const String noResourceFoundResponseMessage = 'No movie found with ID:';
const int testMovieId = 1;
const int nonExistingTestMovieId = 10;
const String testMovieTitle = 'The Greatest Movie of All Time';
const String testMovieDirector = 'The Greatest Director of All Time';
const int testMovieYear = 2025;
