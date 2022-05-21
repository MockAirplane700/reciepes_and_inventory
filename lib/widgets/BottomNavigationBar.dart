import 'package:flutter/material.dart';
import 'package:reciepes_and_inventory/pages/InventoryPage.dart';
import 'package:reciepes_and_inventory/pages/home.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  const CustomBottomNavigationBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = widget.selectedIndex;

    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.library_books_sharp), label: 'Recipes'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Inventory')

        ],
      currentIndex: _selectedIndex,
      onTap: (int index) {
          setState(() {
            _selectedIndex = index;

            if (index == 0) {
              //go to the recipe page
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));
            }else{
              //go to the inventory page
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const InventoryPage()));

            }//end if-else
          });
      },
    );
  }
}
