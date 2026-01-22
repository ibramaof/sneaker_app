import 'package:flutter/material.dart';
import 'package:sneakers_app/modules/cart_page/cart_page.dart';
import 'package:sneakers_app/modules/shop_page/shop_page.dart';
import 'package:sneakers_app/shared/components/g_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pageList = [ShopPage(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      bottomNavigationBar: GNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 80,
                    bottom: 25,
                    start: 50,
                    end: 50,
                  ),
                  child: Image.asset(
                    'lib/images/toppng.com-nike-logo-4944x1950.png',
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Divider(color: Colors.grey[800]),
                ),

                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 12.0),
                  child: ListTile(
                    leading: Icon(Icons.home),
                    iconColor: Colors.white,
                    title: Text('Home', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 12.0),
                  child: ListTile(
                    leading: Icon(Icons.info),
                    iconColor: Colors.white,
                    title: Text('About', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 12.0,
                bottom: 20,
              ),
              child: ListTile(
                leading: Icon(Icons.logout),
                iconColor: Colors.white,
                title: Text('Logout', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      body: pageList[_selectedIndex],
    );
  }
}
