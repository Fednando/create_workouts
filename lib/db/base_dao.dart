

import 'package:createworkouts/db/entity.dart';
import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';

abstract class BaseDao<T extends Entity>{
  Future<Database> get db => DatabaseHelper.getInstance().db;

  T fromMap(Map<String, dynamic> json);
  String get tableName;

  Future<int> save(T entity) async {
    var dbClient = await db;
    var id = await dbClient.insert(tableName, entity.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('id: $id');
    return id;
  }

  Future<int> update(T entity) async {
    var dbClient = await db;
    var id = await dbClient.update(tableName, entity.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('id: $id');
    return id;
  }

  Future<List<T>> query(String sql, [List<dynamic> arguments]) async {
    final dbClient = await db;

    final list = await dbClient.rawQuery(sql, arguments);
    print("list  $list");
    return list.map<T>((json) => fromMap(json)).toList();
  }

  Future<List<T>> findAll() async {
    return query("select * from $tableName");
  }


  Future<T> findById(int id) async {
    final list = await query('select * from $tableName where id = ?', [id]);
    return list.length > 0 ? list.first : null;
  }

  Future<bool> exists(int id) async {
    T entity = await findById(id);
    var exists = entity != null;
    return exists;
  }

  Future<int> count() async {
    final dbClient = await db;
    final list = await dbClient.rawQuery('select count(*) from $tableName');
    return Sqflite.firstIntValue(list);
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from $tableName where id = ?', [id]);
  }

  Future<int> deleteAll() async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from $tableName');
  }
}