import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerapp/Provider/favourite_provider.dart';
import 'package:providerapp/Screens/faverite/favourite_item_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Screen'),
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
                itemCount: 20,
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
