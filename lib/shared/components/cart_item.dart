import 'package:flutter/material.dart';
import 'package:sneakers_app/models/shoe/shoe.dart';

// ignore: must_be_immutable
class CartItem extends StatelessWidget {
  Shoe shoe;
  void Function()? onPressed;
  CartItem({super.key, required this.shoe, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Image.asset(shoe.imagePath),
        title: Text(shoe.name),
        subtitle: Text("\$${shoe.price}"),
        trailing: IconButton(onPressed: onPressed, icon: Icon(Icons.delete)),
      ),
    );
  }
}
