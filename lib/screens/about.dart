import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AUTOLEASE'),
      ),
      body: Text('This is About us Page'),
      drawer: Sidebar(),
    );
  }
}
