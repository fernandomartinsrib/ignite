import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

// Table structure
class AiResponses extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get response => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [AiResponses])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  AppDatabase.forTesting(DatabaseConnection super.connection);

  // Insert a new response
  Future<int> insertAiResponse(String response) {
    return into(aiResponses).insert(AiResponsesCompanion.insert(
      response: response,
    ));
  }

  // Retrieve all responses
  Future<List<AiResponse>> getAllResponses() {
    return select(aiResponses).get();
  }
}

// db connection helper
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ai_responses.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
