import 'package:e_commerce/models/catelog.dart';
import 'package:e_commerce/pages/home_details_page.dart';
import 'package:e_commerce/widgets/home_widgets/catelog_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_to_cart.dart';

class CatelogList extends StatelessWidget {
  const CatelogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: CatelogeModel.items!.length,
        itemBuilder: (context, index) {
          final catelog = CatelogeModel.items![index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Details(
                  catelog: catelog,
                ),
              ),
            ),
            child: CatelogItem(catelog: catelog),
          );
        });
  }
}

class CatelogItem extends StatelessWidget {
  final ProductModel catelog;

  const CatelogItem({Key? key, required this.catelog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catelog.id.toString()),
          child: CatelogImage(image: catelog.image),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catelog.name!.text.lg.color(context.accentColor).bold.make(),
            catelog.desc!.text.textStyle(context.captionStyle!).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                '₹${catelog.price}'.text.bold.xl.make(),
                AddToCart(catelog: catelog),
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(150).make().py16();
  }
}
