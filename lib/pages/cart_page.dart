import 'package:e_commerce/core/store.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:flutter/material.dart';
// import 'package:pay/pay.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: 'Cart'.text.color(context.accentColor).make(),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      body: Column(
        children: [
          Text(
            'Cart',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: context.theme.primaryColor,
            ),
            textScaleFactor: 2,
          ),
          _CartListState().p16().expand(),
          const Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel? cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          20.widthBox,
          VxBuilder(
              builder: (context, dynamic store, _) {
                return '₹${cart!.totalPrice}'.text.xl4.black.bold.make();
              },
              mutations: const {RemoveMutation}),
          30.widthBox,
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () {},
            child: "Checkout".text.white.make(),
          ).expand(),
          20.widthBox,
        ],
      ),
    );
  }
}

class _CartListState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel cart = (VxState.store as MyStore).cart!;
    return cart.items.isEmpty
        ? 'Cart is empty'.text.xl3.makeCentered()
        : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                leading: "${(index + 1)}.".text.xl.make(),
                trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () => RemoveMutation(cart.items[index])),
                title: cart.items[index].name!.text.bold.make(),
                subtitle: "₹${cart.items[index].price}".text.make(),
              ),
            ),
          );
  }
}
