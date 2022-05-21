import 'package:flutter/material.dart';
import 'package:reciepes_and_inventory/customObjects/reciepeObjects.dart';
import 'package:reciepes_and_inventory/logic/recipes.dart';

import '../customObjects/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Recipe> _list = Recipes.getRecipes();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes', style: TextStyle(color: textColor),),
      ),
      backgroundColor: applicationBackgroundColor,
      body: Center(
        child: ListView.builder(
            itemBuilder: (context, index) {
              //NULL CHECK
              if (_list.isEmpty){
                //the list is empty
                return Center(
                  child: Padding(padding: const EdgeInsets.all(5.0), child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text('The listing is currently empty, please wait',style: TextStyle(fontSize: 25,color: textColor),)
                    ],
                  ),),
                );
              }else{
                //the list is not empty
                return Card(
                  color: cardColor,
                  child: Padding(padding: const EdgeInsets.all(10.0), child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(_list[index].networkImage),
                      // TODO: Make the card give the option to display the full recipe through an alert box
                    ],
                  ),),
                );
              }
            },
          itemCount: _list.length,
        ),
      ),
    );
  }
}
