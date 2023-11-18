import 'package:flutter/material.dart';
import '../database/database_helper.dart';

import '../database/training_record.dart';
import 'record_screen.dart';

class RepsScreen extends StatefulWidget {
  final TrainingRecord record;

  RepsScreen({required this.record});

  @override
  _RepsScreenState createState() => _RepsScreenState();
}

class _RepsScreenState extends State<RepsScreen> {
  int selectedReps = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("回数選択"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "$selectedReps 回",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: selectedReps.toDouble(),
              min: 1,
              max: 30,
              divisions: 29,
              label: selectedReps.toString(),
              onChanged: (double value) {
                setState(() {
                  selectedReps = value.round();
                });
              },
            ),
            ElevatedButton(
              child: Text("記録を保存"),
              onPressed: () async {
                widget.record.reps = selectedReps; // 回数を設定

                // データベースヘルパーを使用してレコードをデータベースに保存
                await DatabaseHelper.instance.addTrainingRecord(widget.record.toMap());

                // RecordScreenにナビゲート
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => RecordScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
