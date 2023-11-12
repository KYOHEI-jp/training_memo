import 'package:flutter/material.dart';
import 'database_helper.dart';

class CounterModel with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() async {
    _count++;
    notifyListeners();

    // データベースにカウントを保存
    await DatabaseHelper.instance.insert({
      DatabaseHelper.columnName: 'Count $_count',
    });
  }

  Future<List<Map<String, dynamic>>> getAllCounts() async {
    return await DatabaseHelper.instance.queryAllRows();
  }
}
