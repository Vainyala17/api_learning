import 'package:flutter/material.dart';

class FruitItem extends StatelessWidget {
  FruitItem({required this.item});

  final Fruit item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 140,
      child: Card(
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network(
              item.imgUrl,
              width: 200,
              errorBuilder: (context, error, stackTrace) {

                // Placeholder for error handling
                return Icon(Icons.error);
              },
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      item.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("id: ${item.id}"),
                    Text("quantity: ${item.quantity}"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Fruit {
  final int id;
  final String title;
  final String imgUrl;
  final int quantity;

  Fruit(
      this.id,
      this.title,
      this.imgUrl,
      this.quantity,
      );
  factory Fruit.fromMap(Map<String, dynamic> json) {
    return Fruit(json['id'], json['title'], json['imgUrl'], json['quantity']);
  }
  factory Fruit.fromJson(Map<String, dynamic> json) {
    return Fruit(json['id'], json['title'], json['imgUrl'], json['quantity']);
  }
}

class FruitList extends StatelessWidget {
  final List<Fruit> items;

  FruitList({required Key key, required this.items});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return FruitItem(item: items[index]);
      },
    );
  }
}