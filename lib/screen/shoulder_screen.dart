import 'package:flutter/material.dart';
import '../database/training_record.dart';
import 'weight_screen.dart';

class ShoulderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> exercises = ['ショルダープレス', 'アーノルドプレス', 'サイドレイズ', 'リアレイズ'];

    return Scaffold(
      appBar: AppBar(
        title: Text("肩のトレーニング"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: EdgeInsets.all(10),
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              TrainingRecord record = TrainingRecord(
                part: '肩',
                exercise: exercises[index], weight: null, reps: null,
              );

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => WeightScreen(record: record),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                exercises[index],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
