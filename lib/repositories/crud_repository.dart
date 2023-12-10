import '../dbhelper/db_helper.dart';
// import '../dbhelper/util.dart';
import '../models/crud_model.dart';

class CrudRepository {
  SQFLiteHelper dbHelper = SQFLiteHelper();
  String tableName = "crud";

  Future<List<CrudModel>> getCrud() async {
    var dbClient = await dbHelper.db;
    List<Map> maps = await dbClient.query(tableName, columns: ['id', 'name']);
    List<CrudModel> crud = [];
    for (int i = 0; i < maps.length; i++) {
      crud.add(CrudModel.fromMap(maps[i]));
    }
    return crud;
  }

  Future<int> add(CrudModel crudModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.insert(tableName, crudModel.toMap());
  }

  Future<int> update(CrudModel crudModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.update(tableName, crudModel.toMap(),
        where: 'id = ?', whereArgs: [crudModel.id]);
  }

  Future<int> delete(int id) async {
    var dbClient = await dbHelper.db;
    return await dbClient.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
