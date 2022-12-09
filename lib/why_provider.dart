import 'dart:async';

import 'package:flutter/material.dart';

class WhyProviderScreen extends StatefulWidget {
  const WhyProviderScreen({super.key});

  @override
  State<WhyProviderScreen> createState() => _WhyProviderScreenState();
}

class _WhyProviderScreenState extends State<WhyProviderScreen> {
  int count = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        count++;
        print(count);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Build$count');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Why Provider Screen'),
      ),
      body: Column(
        children: [
          Text(
              "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}"),
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
