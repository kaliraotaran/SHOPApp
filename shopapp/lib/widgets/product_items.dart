// this is gonna be the actual grid item that gets rendered for every product

import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:shopapp/Providers/products.dart';
import 'package:shopapp/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      // this is a widget that gives us rounded corners
      borderRadius: BorderRadius.circular(10),

      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black38,
          leading: Consumer<Product>(
            builder: (ctx, value, child) => IconButton(
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
                color: Theme.of(context).colorScheme.secondary),
          ),
          title: Text(product.title, textAlign: TextAlign.center),
          trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
              color: Theme.of(context).colorScheme.secondary),
        ),
        child: GestureDetector(
          onTap: () {
            //Navigator.of(context).push(
            //   MaterialPageRoute(builder: (ctx) => ProductDetailScreen()));
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(product.imageUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
