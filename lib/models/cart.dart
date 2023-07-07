import 'package:e_commerce/core/store.dart';
import 'package:e_commerce/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatelogeModel _catelog;

  final List<int?> _itemIds = [];

  CatelogeModel get catelog => _catelog;

  set catelog(CatelogeModel newCatelog) {
    _catelog = newCatelog;
  }

  List<ProductModel> get items =>
      _itemIds.map((id) => _catelog.getById(id!)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final ProductModel? item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart!._itemIds.add(item!.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final ProductModel item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart!._itemIds.remove(item.id);
  }
}
