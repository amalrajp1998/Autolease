
import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
class Share extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AUTOLEASE'),
      ),
      body: Text('This is Share a Friend Page'),
      drawer: Sidebar(),
    );
  }
}
