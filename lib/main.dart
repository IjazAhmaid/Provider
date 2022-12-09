import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerapp/Provider/example_one_provider.dart';
import 'package:providerapp/Provider/favourite_provider.dart';

import 'Provider/count_provider.dart';
import 'Provider/theme_changer_provider.dart';
import 'Screens/value_notify_listner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeChanger = Provider.of<ThemeChangerProvider>(context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ExampleOneProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FavouriteItemProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ThemeChangerProvider(),
          ),
        ],
        child: Builder(
          builder: (BuildContext context) {
            final themeChanger = Provider.of<ThemeChangerProvider>(context);
            return MaterialApp(
              title: 'Flutter Demo',
              themeMode: themeChanger.themeMode,
              theme: ThemeData(
                  appBarTheme: const AppBarTheme(color: Colors.brown),
                  brightness: Brightness.light,
                  primarySwatch: Colors.red,
                  iconTheme: const IconThemeData(color: Colors.purpleAccent)),
              darkTheme: ThemeData(
                  appBarTheme: const AppBarTheme(color: Colors.teal),
                  brightness: Brightness.dark,
                  primarySwatch: Colors.red,
                  iconTheme: const IconThemeData(color: Colors.red)),
              home: NotifyListner(),
            );
          },
        ));
  }
}
