import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../database/training_record.dart';
import 'app_screen.dart';
import 'parts_screen.dart';
import 'package:training_memo/database/database_helper.dart';

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
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder<List<TrainingRecord>>(
              future: records,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final record = snapshot.data![index];
                      String formattedDate = DateFormat('yyyy/MM/dd HH:mm')
                          .format(record.createdAt ?? DateTime.now());
                      return Card(
                        child: ListTile(
                          title: Text('${record.part} - ${record.exercise}'),
                          subtitle: Text(
                              '重量: ${record.weight} kg, 回数: ${record.reps}回, 日時: $formattedDate'),
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
          ),
          SizedBox(height: 20),
          Card(
            margin: EdgeInsets.all(8),
            child: ElevatedButton(
              child: Text('トップ画面に戻る'),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => AppScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
