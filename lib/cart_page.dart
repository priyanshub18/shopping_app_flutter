import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void deleteItem(){
    
  }
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    // print(cart);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Cart",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        )),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return Container(
              color: const Color.fromRGBO(245, 247, 249, 1),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Delete Product",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            content: const Text(
                                'Are you sure you want to delete this item from the cart?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "No",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  )),
                              TextButton(
                                  onPressed: (){
                                      Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                                      Navigator.of(context).pop();

                                  },
                                  child: const Text(
                                    "Yes",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  )),
                            ],
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                title: Text(
                  cartItem['title'] as String,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text("Size: ${cartItem['size']}"),
              ),
            );
          }),
    );
  }
}
