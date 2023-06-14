import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  //задаётся state
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<MyApp>{
//лист хронящий элементы из json файла
  List carsList = [];
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
      //заполнение листа по ключу employees
      carsList = data["employees"];
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
          body: carsList.isNotEmpty?ListView.builder(
            //задаётся количество элементов на осноле длинны массива carsList
            itemCount: carsList.length,
            //задаётся itemBuilder
            itemBuilder: (context, index){
              //лист заполняется карточками для отображения данных
              return Card(
                //задаётся ключ элемента листа
                key: ValueKey(carsList[index]["name"]),
                //выставляется отступ между картами
                margin: const EdgeInsets.all(10),
                //прописываются параметры карточек
                child: ListTile(
                  leading: Text(carsList[index]["name"]),
                  title: Text(carsList[index]["type"]),
                  subtitle: Text(carsList[index]["works"].toString(),
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