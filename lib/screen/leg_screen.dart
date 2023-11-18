import 'package:flutter/material.dart';
import '../database/training_record.dart';
import 'weight_screen.dart';

class LegScreen extends StatelessWidget {
  const LegScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> exercises = [
      'スクワット',
      'レッグプレス',
      'ランジ',
      'デッドリフト',
      'レッグエクステンション',
      'レッグカール',
      'カーフレイズ',
      'ステップアップ',
      'バルガリアンスプリットスクワット',
      'フロントスクワット',
      'スミスマシンスクワット',
      'ヒップスラスト',
      'ハックスクワット',
      'グルートブリッジ',
      'ワイドスタンススクワット'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("脚のトレーニング"),
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
          return buildExerciseItem(context, exercises[index], '脚');
        },
      ),
    );
  }

  Widget buildExerciseItem(BuildContext context, String exercise, String part) {
    return InkWell(
      onTap: () {
        TrainingRecord record = TrainingRecord(
          part: part,
          exercise: exercise,
          weight: null,
          reps: null,
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
          exercise,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
