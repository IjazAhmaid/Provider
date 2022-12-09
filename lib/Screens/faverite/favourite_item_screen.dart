import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/favourite_provider.dart';

class FavouriteItemScreen extends StatefulWidget {
  const FavouriteItemScreen({super.key});

  @override
  State<FavouriteItemScreen> createState() => _FavouriteItemScreenState();
}

class _FavouriteItemScreenState extends State<FavouriteItemScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final favouriteitemprovider = Provider.of<FavouriteItemProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Item Screen'),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavouriteItemScreen()));
              },
              child: const Icon(Icons.favorite)),
          const SizedBox(
            width: 60,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteitemprovider.selectedItem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteItemProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                          onTap: () {
                            if (value.selectedItem.contains(index)) {
                              value.removeItem(index);
                            } else {
                              value.addItem(index);
                            }
                          },
                          title: Text('data$index'),
                          trailing: Icon(value.selectedItem.contains(index)
                              ? Icons.favorite
                              : Icons.favorite_border_outlined));
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
