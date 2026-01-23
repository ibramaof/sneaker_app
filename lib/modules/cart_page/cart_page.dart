import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_app/models/shoe/cart.dart';
import 'package:sneakers_app/models/shoe/shoe.dart';
import 'package:sneakers_app/shared/components/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    void deleteItemFromCart(Shoe shoe) {
      Provider.of<Cart>(context, listen: false).removeShoeFromCart(shoe);
    }

    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          //cart title
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              "My Cart",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: value.getUserCartList().length,
              itemBuilder: (context, index) {
                //get shoe from user Cart
                Shoe shoe = value.getUserCartList()[index];

                return CartItem(
                  shoe: shoe,
                  onPressed: () => deleteItemFromCart(shoe),
                );

                //return shoe
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  "Pay",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
