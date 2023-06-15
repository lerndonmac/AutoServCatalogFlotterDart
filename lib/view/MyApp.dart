import 'dart:convert';

import 'package:atuo_catalog/model/Employees.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  //задаётся state
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<MyApp>{
//лист хронящий объекты преобразованные из json файла
  List<Employees> employeesList =[];
//метод запускаемый перед отрисовкой экрана
  @override
  void initState(){
    super.initState();
    jsonRead();
  }
  //метод чтения данных из json
  void jsonRead() async{
    //json файл читается как строка
    final String response = await rootBundle.loadString("assets/json_test.json");
    //конвертация из строки в результативный объект json
    final data = await json.decode(response);
    setState(() {
      //заполнение листа по ключу employees переборкой элементов из получаемого
      // map листа и преобразование их в объекты класса Employees
      for(Map map in data["employees"]){
        employeesList.add(Employees.fromJson(map));
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          //построение верхней панели экрана
          appBar: AppBar(
            //текст в верху окна
            title: const Text("Список Авто"),
            //размещение текста по центру
            centerTitle: true,
          ),
          //построение основной части экрана
        //проверяется что массив не пуст после чего создаётся виджет ListView через Builder
          body: employeesList.isNotEmpty?ListView.builder(
            //задаётся количество элементов на осноле длинны массива employeesList
            itemCount: employeesList.length,
            //задаётся itemBuilder
            itemBuilder: (context, index){
              //лист заполняется карточками для отображения данных
              return Card(
                //задаётся ключ элемента листа
                key: ValueKey(employeesList[index].name),
                //выставляется отступ между картами
                margin: const EdgeInsets.all(10),
                //прописываются параметры карточек
                child: ListTile(
                  leading: Text(employeesList[index].name),
                  title: Text(employeesList[index].type),
                  subtitle: Text(employeesList[index].works.toString(),
                  ),
                ),
              );
            },
            //кнопка
          ): ElevatedButton(
            onPressed: (){
            },
            child: const Center(child: Text("load json"),
            ),
          )
    );
  }


}