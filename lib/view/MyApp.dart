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
  void initState() {
    super.initState();
  }
  void jsonRead() async{
    final String response = await rootBundle.loadString("assets/json_test.json");
    final data = await json.decode(response);
    setState(() {
      carsList = data["employees"];
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Список Авто"),
            centerTitle: true,
          ),
          body: carsList.isNotEmpty?ListView.builder(
            itemCount: carsList.length,
            itemBuilder: (context, index){
              return Card(
                key: ValueKey(carsList[index]["name"]),
                margin: const EdgeInsets.all(10),
                color: Colors.blue,
                child: ListTile(
                  leading: Text(carsList[index]["name"]),
                  title: Text(carsList[index]["type"]),
                  subtitle: Text(carsList[index]["works"].toString(),
                  ),
                ),
              );
            },
          ): ElevatedButton(
            onPressed: (){
              jsonRead();
            },
            child: const Center(child: Text("load json"),
            ),
          )
    );
  }


}