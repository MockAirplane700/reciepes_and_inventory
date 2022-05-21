import 'package:flutter/material.dart';
import 'package:reciepes_and_inventory/customObjects/constants.dart';
import 'package:reciepes_and_inventory/customObjects/item.dart';
import 'package:reciepes_and_inventory/logic/Inventory.dart';
import 'package:reciepes_and_inventory/widgets/BottomNavigationBar.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  final  List<Item> _list = Inventory.getInventory();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory ',),
        backgroundColor: appBarColor,
      ),
      backgroundColor: applicationBackgroundColor,
      body: Center(
        child: ListView.builder(
            itemBuilder: (context, index){
              if (_list.isEmpty){
                //the list is empty\
                return Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text('Data unavailable please wait')
                  ],
                ),);
              }else{
                //the list is not empty
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: const EdgeInsets.all(5.0), child: Image.network(_list[index].networkImage),),
                      Text(_list[index].name),
                      Text(_list[index].expiryDate),
                      Text(_list[index].timeStamp)
                    ],
                  ),
                  color: cardColor,
                );
              }
            },
          itemCount: _list.length,
        )
      ),
      bottomNavigationBar:const CustomBottomNavigationBar(selectedIndex: 1),
    );
  }
}
