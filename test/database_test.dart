import 'package:flutter_test/flutter_test.dart';
import 'package:ignite/database/database.dart';
import 'package:drift/native.dart';
import 'package:drift/drift.dart';

void main() {
  late AppDatabase database;

  setUp(() {
    database =
        AppDatabase.forTesting(DatabaseConnection(NativeDatabase.memory()));
  });

  tearDown(() async {
    await database.close();
  });

  test('Insert and retrieve Gemini responses', () async {
    const testResponse = 'Test res';

    await database.insertAiResponse(testResponse);

    final responses = await database.getAllResponses();

    expect(responses.length, 1);
    expect(responses.first.response, testResponse);
  });

  test('Multiple response', () async {
    final responses = ['res 1', 'res 2', 'res 3'];

    // Insert multiple responses
    for (var response in responses) {
      await database.insertAiResponse(response);
    }

    final storedResponses = await database.getAllResponses();

    expect(storedResponses.length, responses.length);
  });
}
