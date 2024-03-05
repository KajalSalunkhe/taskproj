import 'package:flutter/material.dart';
import 'package:taskproj/model/cart_tem.dart';

class CartScreen extends StatelessWidget {
  final List<CartItem> cartItems;

  CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.network(
                      cartItems[index].product.thumbnail,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItems[index].product.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text('Price: \$${cartItems[index].product.price}'),
                        Text(
                          'Discounted Price: \$${(cartItems[index].product.price - (cartItems[index].product.price * cartItems[index].product.discountPercentage / 100)).toStringAsFixed(2)}',
                        ),
                        Text('Brand: ${cartItems[index].product.brand}'),
                        SizedBox(height: 5),
                        Text(
                          'Quantity: ${cartItems[index].quantity}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
