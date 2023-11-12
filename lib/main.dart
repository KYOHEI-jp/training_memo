import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'database/counter_model.dart';
import 'database/database_helper.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider and SQLite Example',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider and SQLite Example'),
      ),
      body: Center(
        child: Consumer<CounterModel>(
          builder: (context, counter, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${counter.count}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                ElevatedButton(
                  child: Text('Get All Counts'),
                  onPressed: () async {
                    List<Map<String, dynamic>> allCounts =
                        await counter.getAllCounts();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("All Counts"),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: allCounts
                                  .map((count) => Text(
                                      count[DatabaseHelper.columnName]
                                          .toString()))
                                  .toList(),
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<CounterModel>(context, listen: false).increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
