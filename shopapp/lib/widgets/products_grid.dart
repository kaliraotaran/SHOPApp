import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/widgets/product_items.dart';
//import 'package:shopapp/widgets/product_items.dart';
//import '../Providers/products.dart';
import '../Providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showfavs;

  const ProductsGrid({super.key, this.showfavs = false});// this is why the favoite tab isnt showing anything
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showfavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          // create: (context) {},
          // builder: (c) => products[i],
          value: products[i],
          child: ProductItem(
              // products[i].id,
              // products[i].title,
              // products[i].imageUrl,
              )),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
