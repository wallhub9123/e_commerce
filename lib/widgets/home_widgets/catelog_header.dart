import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogHeader extends StatefulWidget {
  const CatelogHeader({super.key});

  @override
  _CatelogHeaderState createState() => _CatelogHeaderState();
}

class _CatelogHeaderState extends State<CatelogHeader> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'E - Shop',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: context.theme.primaryColor,
              ),
              textScaleFactor: 3,
            ),
            5.widthBox,
            const Icon(
              Icons.shopify,
              size: 60,
            ),
          ],
        ),
        const Text(
          'Trending products',
          style: TextStyle(
            color: Colors.black54,
          ),
          textScaleFactor: 1.5,
        ),
      ],
    );
  }
}
