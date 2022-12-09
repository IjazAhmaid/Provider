import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  int x = 10;
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Totorial'),
      ),
      body: Column(
        children: [Center(child: Text(x.toString()))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          x++;
          print(x);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
