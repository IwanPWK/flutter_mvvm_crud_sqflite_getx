import 'package:flutter_mvvm_crud_sqflite_getx/models/crud_model.dart';
import 'package:flutter_mvvm_crud_sqflite_getx/repositories/crud_repository.dart';
import 'package:get/get.dart';

class CrudViewModel extends GetxController {
  var allCrud = <CrudModel>[].obs;
  CrudRepository crudRepository = CrudRepository();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllCrud();
  }

  fetchAllCrud() async {
    var crud = await crudRepository.getCrud();
    allCrud.value = crud;
  }

  addCrud(CrudModel crudModel) {
    crudRepository.add(crudModel);
    fetchAllCrud();
  }

  updateCrud(CrudModel crudModel) {
    crudRepository.update(crudModel);
    fetchAllCrud();
  }

  deleteCrud(int id) {
    crudRepository.delete(id);
    fetchAllCrud();
  }
}
