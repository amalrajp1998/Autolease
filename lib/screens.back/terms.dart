import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AUTOLEASE'),
      ),
      body: Text('This is terms and conditions Page'),
      drawer: Sidebar(),
    );
  }
}
