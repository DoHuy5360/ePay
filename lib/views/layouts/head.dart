import 'package:flutter/material.dart';

class HeadLayout extends StatelessWidget {
  final String title;
  final Widget view;
  const HeadLayout({super.key, required this.title, required this.view});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue[400],
        leading: const Icon(Icons.account_balance),
      ),
      body: Center(child: view),
    );
  }
}
