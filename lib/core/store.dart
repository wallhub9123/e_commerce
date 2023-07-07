import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatelogeModel? catelog;
  CartModel? cart;

  MyStore() {
    catelog = CatelogeModel();
    cart = CartModel();
    cart!.catelog = catelog!;
  }
}
