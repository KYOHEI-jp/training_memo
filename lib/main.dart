import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_memo/screen/parts_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'トレーニングアプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PartsScreen(), // PartsScreenを直接表示
    );
  }
}
