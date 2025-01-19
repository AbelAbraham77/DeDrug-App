import '../database.dart';

class TasksTable extends SupabaseTable<TasksRow> {
  @override
  String get tableName => 'Tasks';

  @override
  TasksRow createRow(Map<String, dynamic> data) => TasksRow(data);
}

class TasksRow extends SupabaseDataRow {
  TasksRow(super.data);

  @override
  SupabaseTable get table => TasksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get task => getField<String>('task');
  set task(String? value) => setField<String>('task', value);

  bool? get setBool => getField<bool>('setBool');
  set setBool(bool? value) => setField<bool>('setBool', value);
}
