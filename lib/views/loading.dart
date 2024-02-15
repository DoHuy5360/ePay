import 'package:flutter/material.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconTheme(
                  data: IconThemeData(
                      color: Theme.of(context).colorScheme.primary),
                  child: const Icon(Icons.crisis_alert_outlined)),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Loading...",
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).colorScheme.primary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
