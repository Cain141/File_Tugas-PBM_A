import 'package:flutter/material.dart';
import 'cart_item.dart';

class CartPage extends StatelessWidget {
  final List<CartItem> cartItems;

  CartPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double totalCartPrice = cartItems.fold(
        0,
        (previous, current) =>
            previous + current.foodMenu.price * current.quantity);

    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang Belanja'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(cartItems[index].foodMenu.imageUrl),
                    title: Text(cartItems[index].foodMenu.name),
                    subtitle: Text('Jumlah: ${cartItems[index].quantity}'),
                    trailing: Text(
                        '\$${(cartItems[index].foodMenu.price * cartItems[index].quantity).toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
            Text(
              'Total: \$${totalCartPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
