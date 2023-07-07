import 'dart:convert';

import 'package:e_commerce/core/store.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/catelog.dart';
import 'package:e_commerce/utils/routes.dart';
import 'package:e_commerce/widgets/home_widgets/catelog_header.dart';
import 'package:e_commerce/widgets/home_widgets/catelog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final url = 'API KEY HERE';
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    final catelogJson =
        await rootBundle.loadString('assets/files/catelog.json');

    final decodedData = jsonDecode(catelogJson);
    var productsData = decodedData['products'];
    CatelogeModel.items = List.from(productsData)
        .map<ProductModel>((item) => ProductModel.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;
    // final dummyList = List.generate(20, (index) => CatelogModel.items[0]);
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, dynamic store, _) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.primaryColor,
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: Colors.white,
            size: 22,
            count: cart!.items.length,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 18,
            top: 18,
            right: 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatelogHeader(),
              if (CatelogeModel.items != null &&
                  CatelogeModel.items!.isNotEmpty)
                const CatelogList().py16().expand()
              else
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
