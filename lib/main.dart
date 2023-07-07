import 'package:e_commerce/pages/cart_page.dart';
import 'package:e_commerce/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'core/store.dart';
import 'pages/home_page.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.black,
      ),
      routes: {
        "/": (context) => const HomePage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.cartRoute: (context) => const CartPage(),
      },
    );
  }
}
