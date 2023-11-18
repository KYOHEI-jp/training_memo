import 'package:flutter/material.dart';
import '../database/training_record.dart';
import 'weight_screen.dart';
import 'dart:ui';

class ArmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 追加された腕のトレーニング種目
    List<String> exercises = [
      'バイセップスカール', 'トライセップスエクステンション', 'ハンマーカール', 'ディップス',
      'プリーチャーカール', 'スカルクラッシャー', 'リストカール', 'リバースカール',
      'コンセントレーションカール', 'トライセップスキックバック',
      'オーバーヘッドトライセップスエクステンション', 'ゼットカール', 'インクラインカール',
      'クローズグリップベンチプレス', 'ケーブルカール', 'トライセップスローププッシュダウン',
      'シングルアームダンベルカール', 'リバースグリップベントオーバーロウ',
      'アームブラスターカール', 'クロスボディハンマーカール'
    ];


    // 単純な文字列比較を使用してリストをソート
    exercises.sort((a, b) => a.compareTo(b));

    return Scaffold(
      appBar: AppBar(
        title: Text("腕のトレーニング"),
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
                part: '腕',
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