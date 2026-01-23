import 'package:flutter/material.dart';
import 'package:sneakers_app/models/shoe/shoe.dart';

class Cart extends ChangeNotifier {
  //list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Air Jordan',
      price: '120',
      imagePath: 'lib/images/3191.jpg',
      description:
          'Inspired by the original that debuted in 1985, the Air Jordan 1 Low offers a clean, classic look',
    ),
    Shoe(
      name: 'Ja 3',
      price: '145',
      imagePath: 'lib/images/compressed_7b48ed22e05748e21bbff2cd0490420b.webp',
      description:
          "Every time Ja steps on the court, it's showtime. To help him elevate his game, we worked with him to make the bounciest Ja signature shoe so far.",
    ),
    Shoe(
      name: 'Kobe IX Elite Low',
      price: '190',
      imagePath: 'lib/images/compressed_22df5a6aa5118f217d11a5220953752c.webp',
      description:
          'Kobe’s comeback from a torn Achilles inspired generations of past, present and future hoopers to keep fighting. ',
    ),
    Shoe(
      name: 'Nike Air Max 270',
      price: '119',
      imagePath: 'lib/images/compressed_a525d72921c782c90990e197fbd09949.webp',
      description: 'The Air Max 270 brings style, comfort and big attitude.',
    ),
  ];

  //list of items in user cart
  List<Shoe> userCart = [];

  // get shoe list
  List<Shoe> getSheoList() {
    return shoeShop;
  }

  //get user cart list

  List<Shoe> getUserCartList() {
    return userCart;
  }

  //add shoe to cart
  void addShoeToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove shoe from cart
  void removeShoeFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
