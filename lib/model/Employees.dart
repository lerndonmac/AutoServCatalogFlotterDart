
//класс для построения элемента json файла
class Employees {
  //поля класса
  String name;
  String type;
  List works;

  //конструктор класса
  Employees(this.name, this.type, this.works);
  //конструктор класса на основе fromJson
  factory Employees.fromJson(Map<dynamic, dynamic>jsonMap ){
    return Employees(jsonMap["name"]as String, jsonMap["type"]as String, jsonMap["works"]as List);

  }
  // конвертация в json
  Map toJson()=>{"name": name, "type": type, "works":works};

  @override
  String toString() {
    return 'Employees{name: $name }';
  }
}