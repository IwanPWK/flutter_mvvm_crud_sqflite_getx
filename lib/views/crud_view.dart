import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/crud_model.dart';
import '../viewmodel/crud_viewmodel.dart';

class CrudPage extends StatefulWidget {
  const CrudPage({Key? key}) : super(key: key);

  @override
  State<CrudPage> createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  final crudViewModel = Get.put(CrudViewModel());
  final nameController = TextEditingController();
  int? crudId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Obx(() => Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Enter name'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          if (nameController.text != "") {
                            crudViewModel.addCrud(
                                CrudModel(id: null, name: nameController.text));
                            nameController.text = "";
                          }
                        },
                        child: const Text("Add")),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (nameController.text != "") {
                            crudViewModel.updateCrud(CrudModel(
                                id: crudId, name: nameController.text));
                            nameController.text = "";
                          }
                        },
                        child: const Text("Update"))
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: crudViewModel.allCrud.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              crudId = crudViewModel.allCrud[index].id!;
                              nameController.text =
                                  crudViewModel.allCrud[index].name!;
                            },
                            child: Card(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                          crudViewModel.allCrud[index].name!),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        crudViewModel.deleteCrud(
                                            crudViewModel.allCrud[index].id!);
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                        size: 32,
                                      ))
                                ],
                              ),
                            ),
                          );
                        }))
              ],
            ),
          )),
    ));
  }
}
