import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/example_one_provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example One'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Slider(
                  min: 0,
                  max: 1,
                  value: value.value,
                  onChanged: (val) {
                    // print(value);
                    value.setValue(val);
                  });
            },
          ),
          Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(value.value)),
                        child: const Center(
                          child: Text('Container One'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.redAccent.withOpacity(value.value)),
                        child: const Center(
                          child: Text('Container Two'),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
