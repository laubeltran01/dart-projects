import 'package:moovies_api/moovies_api.dart';
import 'package:aqueduct_test/aqueduct_test.dart';

export 'package:moovies_api/moovies_api.dart';
export 'package:aqueduct_test/aqueduct_test.dart';
export 'package:test/test.dart';
export 'package:aqueduct/aqueduct.dart';

class Harness extends TestHarness<MooviesApiChannel> with TestHarnessORMMixin {
  @override
  ManagedContext get context => channel.context;

  @override
  Future onSetUp() async {
    await resetData();
  }
}
