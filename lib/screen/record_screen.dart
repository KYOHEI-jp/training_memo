import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../database/training_record.dart';
import 'parts_screen.dart'; // PartsScreenをインポート
class RecordScreen extends StatefulWidget {
  @override
  _RecordScreenState createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  late Future<List<TrainingRecord>> records;

  @override
  void initState() {
    super.initState();
    records = DatabaseHelper.instance.getTrainingRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("トレーニング記録"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => PartsScreen()),
            );
          },
        ),
      ),
      body: FutureBuilder<List<TrainingRecord>>(
        future: records,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final record = snapshot.data![index];
                return Card(
                  child: ListTile(
                    title: Text('${record.part} - ${record.exercise}'),
                    subtitle: Text('重量: ${record.weight} kg, 回数: ${record.reps}回'),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('エラーが発生しました: ${snapshot.error}');
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
