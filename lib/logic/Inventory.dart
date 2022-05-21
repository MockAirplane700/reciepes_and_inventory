import 'package:reciepes_and_inventory/customObjects/item.dart';

class Inventory {
  static final List<Item> _inventory = [
    Item(
        networkImage: 'https://www.dinnerplanner.com/wp-content/uploads/2018/06/raw-chicken.jpg',
        name: 'Chicken thighs',
        expiryDate: '20/12/2025',
        timeStamp: '1653176378'
    ),
    Item(
        networkImage: 'https://www.dinnerplanner.com/wp-content/uploads/2018/06/raw-chicken.jpg',
        name: 'Chicken thighs',
        expiryDate: '20/12/2025',
        timeStamp: '1653176378'
    ),
    Item(
        networkImage: 'https://www.dinnerplanner.com/wp-content/uploads/2018/06/raw-chicken.jpg',
        name: 'Chicken thighs',
        expiryDate: '20/12/2025',
        timeStamp: '1653176378'
    ),
    Item(
        networkImage: 'https://www.dinnerplanner.com/wp-content/uploads/2018/06/raw-chicken.jpg',
        name: 'Chicken thighs',
        expiryDate: '20/12/2025',
        timeStamp: '1653176378'
    ),
  ];

  static List<Item> getInventory() {return _inventory;}
}