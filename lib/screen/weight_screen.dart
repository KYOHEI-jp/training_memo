import 'package:flutter/material.dart';
import 'package:training_memo/screen/reps_screen.dart';

import '../database/training_record.dart';

class WeightScreen extends StatefulWidget {
  final TrainingRecord record;

  WeightScreen({required this.record});

  @override
  _WeightScreenState createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  int selectedRange = 1; // 選択された重量範囲を示す (1: 1-100, 2: 101-200, 3: 201-300)
  double selectedWeight = 1; // 選択された重量

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("重量選択"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "${getWeightDisplay().toStringAsFixed(0)} kg", // 小数点以下を削除
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          buildSlider(1, 100, selectedRange == 1 ? selectedWeight : 1),
          buildSlider(101, 200, selectedRange == 2 ? selectedWeight : 101),
          buildSlider(201, 300, selectedRange == 3 ? selectedWeight : 201),
          ElevatedButton(
            child: Text("次へ"),
            onPressed: () {
              print("次へボタンが押されました"); // デバッグプリント

              widget.record.weight = getWeightDisplay().round(); // 選択された重量を設定

              // 次の画面に遷移
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RepsScreen(record: widget.record),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildSlider(double min, double max, double value) {
    return Slider(
      value: value,
      min: min,
      max: max,
      divisions: (max - min).toInt(),
      onChanged: (newValue) {
        setState(() {
          selectedRange = (min == 1) ? 1 : ((min == 101) ? 2 : 3);
          selectedWeight = newValue;
        });
      },
    );
  }

  double getWeightDisplay() {
    double weight;
    if (selectedRange == 1) {
      weight = selectedWeight.clamp(1, 100);
    } else if (selectedRange == 2) {
      weight = selectedWeight.clamp(101, 200);
    } else {
      weight = selectedWeight.clamp(201, 300);
    }
    return weight.roundToDouble(); // 小数点以下を丸める
  }
}
