class CatelogeModel {
  static List<ProductModel>? items;

  ProductModel getById(int? id) => items!.firstWhere(
        (element) => element.id == id,
      );

  ProductModel getByPosition(int pos) => items![pos];
}

class ProductModel {
  final int? id;
  final String? name;
  final String? desc;
  final num price;
  final String? color;
  final String? image;

  ProductModel(
      {this.id,
      this.name,
      this.desc,
      required this.price,
      this.color,
      this.image});

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      color: map['color'],
      image: map['image'],
    );
  }

  toMap() => {
        'id': id,
        'name': name,
        'desc': desc,
        'price': price,
        'color': color,
        'image': image,
      };
}
