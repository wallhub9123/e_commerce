import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogImage extends StatelessWidget {
  final String? image;

  const CatelogImage({Key? key, required this.image})
      : assert(image != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return FancyShimmerImage(
      imageUrl: image!,
      boxFit: BoxFit.contain,
    ).box.rounded.p8.color(context.canvasColor).make().p16().w40(context);
  }
}
