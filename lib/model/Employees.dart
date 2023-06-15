class Employees {
  String name;
  String type;
  List works;

  Employees(this.name, this.type, this.works);
  factory Employees.fromJson(Map<dynamic, dynamic>jsonMap ){
    return Employees(jsonMap["name"]as String, jsonMap["type"]as String, jsonMap["works"]as List);

  }

  @override
  String toString() {
    return 'Employees{type: $name}';
  }
}