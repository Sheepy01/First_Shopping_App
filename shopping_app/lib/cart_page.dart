import 'package:first_shopping_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
        ),
        body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                  backgroundImage: AssetImage(cartItem["imageUrl"] as String),
                  radius: 40),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Delete Product?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          content: const Text("Are you sure?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "No",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<CartProvider>()
                                    .removeProduct(cartItem);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Yes",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            )
                          ],
                        );
                      });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              title: Text(cartItem["title"] as String,
                  style: Theme.of(context).textTheme.bodySmall),
              subtitle: Text("Size: ${cartItem["size"]}"),
            );
          },
        ));
  }
}
