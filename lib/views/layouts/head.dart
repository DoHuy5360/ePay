import 'package:flutter/material.dart';

class HeadLayout extends StatelessWidget {
  final String title;
  final Widget view;
  const HeadLayout({super.key, required this.title, required this.view});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const IconTheme(
              data: IconThemeData(color: Colors.white),
              child: Icon(Icons.arrow_back)),
        ),
      ),
      body: Center(child: view),
    );
  }
}
