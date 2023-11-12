import 'package:flutter/cupertino.dart';
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
  int selectedWeight = 1;

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
            Container(
              height: 200,
              child: CupertinoPicker(
                itemExtent: 32.0,
                onSelectedItemChanged: (int index) {
                  setState(() {
                    selectedWeight = index + 1;
                  });
                },
                children: List<Widget>.generate(100, (int index) {
                  return Center(
                    child: Text(
                      '${index + 1} kg',
                      style: TextStyle(fontSize: 24),
                    ),
                  );
                }),
              ),
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
