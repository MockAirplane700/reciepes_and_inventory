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
            },
          itemCount: _list.length,
        ),
      ),
    );
  }
}
