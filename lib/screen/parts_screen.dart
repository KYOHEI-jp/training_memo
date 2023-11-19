import 'package:flutter/material.dart';
import 'package:training_memo/screen/chest_screen.dart';
import 'package:training_memo/screen/leg_screen.dart';
import 'arm_screen.dart';
import 'shoulder_screen.dart'; // ShoulderScreenをインポート
import 'back_screen.dart'; // BackScreenをインポート

class PartsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 部位のリスト
    List<Map<String, dynamic>> parts = [
      {'name': '肩', 'screen': ShoulderScreen()},
      {'name': '胸', 'screen': ChestScreen()},
      {'name': '背中', 'screen': BackScreen()},
      {'name': '腕', 'screen': ArmScreen()},
      {'name': '脚', 'screen': LegScreen()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('トレーニング部位'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: EdgeInsets.all(10),
        itemCount: parts.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (parts[index]['screen'] != null) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => parts[index]['screen']),
                );
              }
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                parts[index]['name'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
