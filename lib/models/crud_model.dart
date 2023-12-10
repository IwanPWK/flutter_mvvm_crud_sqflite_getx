class CrudModel {
  int? id;
  String? name;

  CrudModel({this.id, this.name});

  factory CrudModel.fromMap(Map<dynamic, dynamic> json) {
    return CrudModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
