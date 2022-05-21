import 'package:flutter/material.dart';
import 'package:reciepes_and_inventory/customObjects/reciepeObjects.dart';
import 'package:reciepes_and_inventory/logic/recipes.dart';
import 'package:reciepes_and_inventory/widgets/BottomNavigationBar.dart';

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
        backgroundColor: appBarColor,
      ),
      bottomNavigationBar:const CustomBottomNavigationBar(selectedIndex: 0),
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
                      Row(children: [
                        Text(_list[index].dishName)
                      ],),
                      ElevatedButton(
                          onPressed: () {
                           // Make the card give the option to display the full recipe through an alert box
                            List<String> _steps = _list[index].steps;
                            List<String> _ingridents = _list[index].ingridents;

                            showDialog(
                                context: context,
                                builder: (BuildContext context)=> AlertDialog(
                                  title: const Text('Alert Dialog'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                    children: [
                                      //the ingredients listing
                                     Flexible(child:  Container(
                                       child: ListView.builder(
                                         itemBuilder: (context, index) {
                                           return Row(children: [
                                             Text(index.toString()),
                                             Text(_ingridents[index])
                                           ],);
                                         },
                                         itemCount: _ingridents.length,
                                       ),
                                       height: MediaQuery.of(context).size.height/2,
                                       width: MediaQuery.of(context).size.width/2,
                                     )),
                                      //the steps involved
                                      Flexible(
                                        child: Container(
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return Row(children: [
                                                Flexible(child: Text(index.toString())),
                                                Flexible(child:  Text(_steps[index]))
                                              ],);
                                            },
                                            itemCount: _steps.length,
                                          ),
                                          height: MediaQuery.of(context).size.height/2,
                                          width: MediaQuery.of(context).size.width,
                                          
                                        ),
                                      ),
                                    ],),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () => Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel')
                                    ),
                                    TextButton(
                                        onPressed: () => Navigator.pop(context, 'Ok'),
                                        child: const Text('OK')
                                    )
                                  ],
                                )
                            );
                          },
                          child: const Text('View Recipe')
                      )
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
