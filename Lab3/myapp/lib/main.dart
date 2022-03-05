import 'package:flutter/material.dart';
import 'package:myapp/providers/cart_provider.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/screens/store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'My Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        initialRoute: Home.routeName,
        routes: {
          Home.routeName: (context) => Home(),
          Store.routeName: (context) => Store(),
        },
      ),
    );
  }
}
