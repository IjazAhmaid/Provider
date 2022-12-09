import 'package:flutter/material.dart';

class NotifyListner extends StatelessWidget {
  NotifyListner({super.key});
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notify Listner'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          ValueListenableBuilder(
            valueListenable: toggle,
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  obscureText: toggle.value,
                  decoration: InputDecoration(
                    suffix: InkWell(
                        onTap: () {
                          toggle.value = !toggle.value;
                        },
                        child: Icon(toggle.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility)),
                    hintText: 'password',
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 170,
          ),
          Center(
            child: ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) {
                  return Text(_counter.value.toString());
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        tooltip: 'Action neded',
        child: const Icon(Icons.add),
      ),
    );
  }
}
