import 'package:flutter/material.dart';

class SatatefullWidget extends StatefulWidget {
  const SatatefullWidget({super.key});

  @override
  State<SatatefullWidget> createState() => _SatatefullWidgetState();
}

class _SatatefullWidgetState extends State<SatatefullWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statefull Widget'),
      ),
      body: Column(
        children: [
          Text(DateTime.now().toString()),
          Center(child: Text(count.toString()))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
          print(count);
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
