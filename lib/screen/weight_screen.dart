import 'package:flutter/material.dart';
import '../database/training_record.dart';
import 'reps_screen.dart';

class WeightScreen extends StatefulWidget {
  final TrainingRecord record;

  WeightScreen({required this.record});

  @override
  _WeightScreenState createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  int selectedWeight = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("重量選択"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "$selectedWeight kg",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: selectedWeight.toDouble(),
              min: 1,
              max: 100,
              divisions: 99,
              label: selectedWeight.toString(),
              onChanged: (double value) {
                setState(() {
                  selectedWeight = value.round();
                });
              },
            ),
            ElevatedButton(
              child: Text("次へ"),
              onPressed: () {
                widget.record.weight = selectedWeight;

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RepsScreen(record: widget.record),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
