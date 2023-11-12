import 'package:flutter/material.dart';

class BackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("背中のトレーニング"),
      ),
      body: Center(
        child: Text("背中のトレーニング内容"),
      ),
    );
  }
}
