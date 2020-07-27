import 'harness/app.dart';

Future main() async {
  final harness = Harness()..install();
  const title = 'RESTful web APIs test';
  const author = 'Test User';
  const year = 2058;

  group("GET: ", () {
    test("GET /movies return 200 OK", () async {
      final response = await harness.agent.get('/movies');
      expect(response.statusCode, 200);
    });

    test("GET /whatever return 404 Not Found", () async {
      final response = await harness.agent.get('/moviesTest');
      expect(response.statusCode, 404);
    });

    test("GET /movies/1 return 404 Not Found for empty db", () async {
      final response = await harness.agent.get('/movies/1');
      expect(response.statusCode, 404);
    });

    test(
        "GET /movies/id return object after POST request has the expected body",
        () async {
      final postResponse = await harness.agent.post('/movies',
          body: {'title': title, 'author': author, 'year': year});
      final id = postResponse.body.as<Map>()['id'];
      final response = await harness.agent.get('movies/$id');
      expectResponse(response, 200,
          body: {'id': id, 'title': title, 'author': author, 'year': year});
    });
  });

  group("POST: ", () {
    test("POST /movies return 400 bad Request for empty body", () async {
      final response = await harness.agent.post('/movies', body: {});
      expect(response.statusCode, 400);
    });

    test("POST /movies return 200 OK for body with valid keys", () async {
      final postResponse = await harness.agent.post('/movies', body: {
        'title': '${title}post',
        'author': '${author}post',
        'year': year + 1
      });
      expect(postResponse.statusCode, 200);
    });

    test("POST /movies/id return 400 bad Request for wrong body", () async {
      final postResponse = await harness.agent.post('/movies',
          body: {'tTest': title, 'aTest': author, 'yTest': year});
      expect(postResponse.statusCode, 400);
    });
  });

  group("Delete: ", () {
    test("DELETE /movies/1 return 'Deleted 0 movie(s)' for empty db", () async {
      final response = await harness.agent.delete('/movies/1');
      expectResponse(response, 200, body: {'message': "Deleted 0 movie(s)"});
    });

    test("DELETE /movies/id return 200 OK row deleted", () async {
      final postResponse = await harness.agent.post('/movies', body: {
        'title': '${title}del',
        'author': '${author}del',
        'year': year + 2
      });
      final id = postResponse.body.as<Map>()['id'];
      final response = await harness.agent.delete('movies/$id');
      expect(response.statusCode, 200);
    });
  });

  group("PUT: ", () {
    test("PUT /movies return 200 OK for body with valid keys", () async {
      final postResponse = await harness.agent.post('/movies', body: {
        'title': '${title}putpost',
        'author': '${author}putpost',
        'year': year
      });
      final id = postResponse.body.as<Map>()['id'];
      final putResponse = await harness.agent.put('/movies/$id', body: {
        'title': '${title}put',
        'author': '${author}put',
        'year': year + 3
      });
      expectResponse(putResponse, 200, body: {
        'id': id,
        'title': '${title}put',
        'author': '${author}put',
        'year': year + 3
      });
    });

    test("PUT /movies/id return 400 bad Request for wrong body", () async {
      final postResponse = await harness.agent.put('/movies/1',
          body: {'tTest': title, 'aTest': author, 'yTest': year});
      expect(postResponse.statusCode, 400);
    });
  });

  group("PATCH: ", () {
    test("PATCH /movies return 200 OK for body with valid keys", () async {
      final postResponse = await harness.agent.post('/movies', body: {
        'title': '${title}patchpost',
        'author': '${author}patchpost',
        'year': year
      });
      final id = postResponse.body.as<Map>()['id'];
      final putResponse = await harness.agent.execute('PATCH', '/movies/$id',
          body: {
            'title': '${title}patch',
            'author': '${author}patch',
            'year': year + 3
          });
      expectResponse(putResponse, 200, body: {
        'id': id,
        'title': '${title}patch',
        'author': '${author}patch',
        'year': year + 3
      });
    });

    test("PATCH /movies/id return 400 bad Request for wrong body", () async {
      final postResponse = await harness.agent.execute('PATCH', '/movies/1',
          body: {'tTest': title, 'aTest': author, 'yTest': year});
      expect(postResponse.statusCode, 400);
    });
  });
}
