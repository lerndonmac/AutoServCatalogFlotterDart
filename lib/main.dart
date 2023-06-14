import 'package:atuo_catalog/view/MyApp.dart';
import 'package:flutter/material.dart';


void main() {
  //запускаем приложение вызовом супер метода runApp во входные параметры которого
  //вставляем встроенный виджет MaterialApp
  runApp(MaterialApp(
    //прописана тема виджета
    theme: ThemeData(
      //начальный цвет выставлен на голубой
      primaryColor: Colors.blue,

    ),
    //выставлен класс MyApp в качестве окна приложения
    home: MyApp(),
  ));
}





