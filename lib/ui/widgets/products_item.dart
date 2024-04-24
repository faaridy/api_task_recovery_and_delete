import 'package:flutter/material.dart';

import 'package:api_task/data/models/product_response.dart';

class ProductsItem extends StatelessWidget {
  const ProductsItem({
    super.key,
    required this.productResponse,
    required this.onPressed,
    required this.icon,
  });
  final ProductResponse productResponse;
  final void Function() onPressed;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        children: [
          IconButton(
              onPressed: onPressed,
              icon: icon),
          SizedBox(
              width: 80,
              height: 80,
              child: Image.network(productResponse.image!)),
          Text(
            productResponse.title!,
            maxLines: 2,
          ),
          Text(productResponse.price.toString()),
        ],
      ),
    );
  }
}
