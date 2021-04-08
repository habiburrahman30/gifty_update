import 'package:flutter/material.dart';

class OrderItemsPage extends StatelessWidget {
  final List orderItems;

  OrderItemsPage({@required this.orderItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Items',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: ListView.builder(
          itemCount: orderItems.length,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (BuildContext context, int index) {
            final item = orderItems[index];
            return Column(
              children: [
                Divider(),
                Text('${item['title']}'),
                Text('${item['price']}'),
                Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
