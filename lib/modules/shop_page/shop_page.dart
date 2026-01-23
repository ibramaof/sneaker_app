import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_app/models/shoe/cart.dart';
import 'package:sneakers_app/models/shoe/shoe.dart';
import 'package:sneakers_app/shared/components/shoe_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add item to cart
  void addItemToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addShoeToCart(shoe);

    //show alert
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Successfully added!"),
        content: Text('Check your cart'),
      ),
    );
  }

  Cart cart = Cart();
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Search", style: TextStyle(color: Colors.grey)),
                Icon(Icons.search, color: Colors.grey),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              'everyone flies..some fly longer than others',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hot Picks 🔥',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text('see all', style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: cart.shoeShop.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                //create shoe from shoplist
                Shoe shoe = value.getSheoList()[index];
                //return shoe
                return ShoeTile(shoe: shoe, onTap: () => addItemToCart(shoe));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 25,
              start: 25,
              end: 25,
            ),
            child: Divider(color: Colors.grey[300]),
          ),
        ],
      ),
    );
  }
}
