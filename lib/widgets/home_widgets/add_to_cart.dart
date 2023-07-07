import 'package:e_commerce/core/store.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/catelog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final ProductModel? catelog;
  const AddToCart({Key? key, this.catelog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel cart = (VxState.store as MyStore).cart!;
    bool isInCart = cart.items.contains(catelog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catelog!);
        }
      },
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(context.theme.primaryColor),
          shape: MaterialStateProperty.all(
            const StadiumBorder(),
          )),
      child: isInCart
          ? const Icon(
              Icons.done,
              color: Colors.white,
            )
          : const Icon(
              CupertinoIcons.cart_badge_plus,
              color: Colors.white,
            ),
    );
  }
}
