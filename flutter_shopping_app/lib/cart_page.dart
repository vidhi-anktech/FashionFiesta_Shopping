import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index){
          final cartItem = cart[index];

          return ListTile(
            leading: CircleAvatar(
              foregroundImage: AssetImage(cartItem['imageUrl'] as String,),
              radius: 30,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete,
              color: Colors.red,),
              onPressed: () {
                // showDialog(
                //  context: context,
                //  builder: )
              },
            ),
            title: Text(cartItem['title'].toString(),
            style:Theme.of(context).textTheme.bodySmall,),
            subtitle: Text('Size : ${cartItem['size']}',),
          );
      }),
    );
  }
}