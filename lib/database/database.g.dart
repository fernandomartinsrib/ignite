// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AiResponsesTable extends AiResponses
    with TableInfo<$AiResponsesTable, AiResponse> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AiResponsesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _responseMeta =
      const VerificationMeta('response');
  @override
  late final GeneratedColumn<String> response = GeneratedColumn<String>(
      'response', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, response, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ai_responses';
  @override
  VerificationContext validateIntegrity(Insertable<AiResponse> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('response')) {
      context.handle(_responseMeta,
          response.isAcceptableOrUnknown(data['response']!, _responseMeta));
    } else if (isInserting) {
      context.missing(_responseMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AiResponse map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AiResponse(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      response: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}response'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $AiResponsesTable createAlias(String alias) {
    return $AiResponsesTable(attachedDatabase, alias);
  }
}

class AiResponse extends DataClass implements Insertable<AiResponse> {
  final int id;
  final String response;
  final DateTime createdAt;
  const AiResponse(
      {required this.id, required this.response, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['response'] = Variable<String>(response);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AiResponsesCompanion toCompanion(bool nullToAbsent) {
    return AiResponsesCompanion(
      id: Value(id),
      response: Value(response),
      createdAt: Value(createdAt),
    );
  }

  factory AiResponse.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AiResponse(
      id: serializer.fromJson<int>(json['id']),
      response: serializer.fromJson<String>(json['response']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'response': serializer.toJson<String>(response),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AiResponse copyWith({int? id, String? response, DateTime? createdAt}) =>
      AiResponse(
        id: id ?? this.id,
        response: response ?? this.response,
        createdAt: createdAt ?? this.createdAt,
      );
  AiResponse copyWithCompanion(AiResponsesCompanion data) {
    return AiResponse(
      id: data.id.present ? data.id.value : this.id,
      response: data.response.present ? data.response.value : this.response,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AiResponse(')
          ..write('id: $id, ')
          ..write('response: $response, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, response, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AiResponse &&
          other.id == this.id &&
          other.response == this.response &&
          other.createdAt == this.createdAt);
}

class AiResponsesCompanion extends UpdateCompanion<AiResponse> {
  final Value<int> id;
  final Value<String> response;
  final Value<DateTime> createdAt;
  const AiResponsesCompanion({
    this.id = const Value.absent(),
    this.response = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AiResponsesCompanion.insert({
    this.id = const Value.absent(),
    required String response,
    this.createdAt = const Value.absent(),
  }) : response = Value(response);
  static Insertable<AiResponse> custom({
    Expression<int>? id,
    Expression<String>? response,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (response != null) 'response': response,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AiResponsesCompanion copyWith(
      {Value<int>? id, Value<String>? response, Value<DateTime>? createdAt}) {
    return AiResponsesCompanion(
      id: id ?? this.id,
      response: response ?? this.response,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (response.present) {
      map['response'] = Variable<String>(response.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AiResponsesCompanion(')
          ..write('id: $id, ')
          ..write('response: $response, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AiResponsesTable aiResponses = $AiResponsesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [aiResponses];
}

typedef $$AiResponsesTableCreateCompanionBuilder = AiResponsesCompanion
    Function({
  Value<int> id,
  required String response,
  Value<DateTime> createdAt,
});
typedef $$AiResponsesTableUpdateCompanionBuilder = AiResponsesCompanion
    Function({
  Value<int> id,
  Value<String> response,
  Value<DateTime> createdAt,
});

class $$AiResponsesTableFilterComposer
    extends Composer<_$AppDatabase, $AiResponsesTable> {
  $$AiResponsesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get response => $composableBuilder(
      column: $table.response, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$AiResponsesTableOrderingComposer
    extends Composer<_$AppDatabase, $AiResponsesTable> {
  $$AiResponsesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get response => $composableBuilder(
      column: $table.response, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$AiResponsesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AiResponsesTable> {
  $$AiResponsesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get response =>
      $composableBuilder(column: $table.response, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AiResponsesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AiResponsesTable,
    AiResponse,
    $$AiResponsesTableFilterComposer,
    $$AiResponsesTableOrderingComposer,
    $$AiResponsesTableAnnotationComposer,
    $$AiResponsesTableCreateCompanionBuilder,
    $$AiResponsesTableUpdateCompanionBuilder,
    (AiResponse, BaseReferences<_$AppDatabase, $AiResponsesTable, AiResponse>),
    AiResponse,
    PrefetchHooks Function()> {
  $$AiResponsesTableTableManager(_$AppDatabase db, $AiResponsesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AiResponsesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AiResponsesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AiResponsesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> response = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              AiResponsesCompanion(
            id: id,
            response: response,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String response,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              AiResponsesCompanion.insert(
            id: id,
            response: response,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AiResponsesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AiResponsesTable,
    AiResponse,
    $$AiResponsesTableFilterComposer,
    $$AiResponsesTableOrderingComposer,
    $$AiResponsesTableAnnotationComposer,
    $$AiResponsesTableCreateCompanionBuilder,
    $$AiResponsesTableUpdateCompanionBuilder,
    (AiResponse, BaseReferences<_$AppDatabase, $AiResponsesTable, AiResponse>),
    AiResponse,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AiResponsesTableTableManager get aiResponses =>
      $$AiResponsesTableTableManager(_db, _db.aiResponses);
}
