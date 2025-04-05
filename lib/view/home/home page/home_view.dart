import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical/view/cart/cart_body.dart';
import 'package:medical/view/constance.dart';
import 'package:medical/view/home/home%20page/home_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    HomeBody(),
    CartBody(),
    const Center(child: Text("Map")),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Constance.backgroundColor[0],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black54,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.house), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.cartShopping),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.locationDot),
              label: "Map",
            ),
          ],
        ),
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
              colors: Constance.backgroundColor,
            ),
          ),
          child: Center(child: _widgetOptions.elementAt(_selectedIndex)),
        ),
      ),
    );
  }
}
