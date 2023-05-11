import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:shopapp/model/products.dart';
import '../Providers/products_provider.dart';
import '../widgets/products_grid.dart';

enum FilterOption { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var ShowOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOption selectedValue) {
              setState(() {
                if (selectedValue == FilterOption.Favorites) {
                  ShowOnlyFavorites = true;
                } else {
                  ShowOnlyFavorites = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              // ignore: sort_child_properties_last
              const PopupMenuItem(
                value: FilterOption.Favorites,
                child: Text('only Favorites'),
              ),
              const PopupMenuItem(
                value: FilterOption.All,
                child: Text('Show All'),
              ),
            ],
          )
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
