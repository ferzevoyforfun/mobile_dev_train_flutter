import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лабораторная работа №1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лабораторная №1: Базовый UI'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Первый Container
          Container(
            width: 200,
            height: 100,
            color: Colors.redAccent,
          ),

          // Row с тремя текстами
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text('Текст 1', style: TextStyle(fontSize: 18)),
              Text('Текст 2', style: TextStyle(fontSize: 18)),
              Text('Текст 3', style: TextStyle(fontSize: 18)),
            ],
          ),

          // Второй Container
          Container(
            width: 300,
            height: 150,
            color: Colors.greenAccent,
          ),

          // Expanded с Row и CircleAvatars
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blue,
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/44375456', // Пример изображения с GitHub
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}