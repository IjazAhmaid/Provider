import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerapp/Provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 2), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Example With Provider'),
      ),
      body: Consumer<CountProvider>(
        builder: (context, value, child) {
          return Center(child: Text(value.count.toString()));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
          const Icon(
            Icons.add,
          );
        },
      ),
    );
  }
}
