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
}
