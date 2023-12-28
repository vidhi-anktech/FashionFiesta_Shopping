import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetail({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String selectedSize = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                widget.product['imageUrl'] as String,
                height: 230,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(216, 240, 253, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('INR ${widget.product['price']}',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 40,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: (widget.product['sizes'] as List<String>)
                                .length,
                            itemBuilder: (context, index) {
                              final size = (widget.product['sizes']
                                  as List<String>)[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize = size;
                                  });
                                },
                                child: Chip(
                                  label: Text(size.toString()),
                                  backgroundColor: selectedSize == size
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                ),
                              );
                            }),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 25.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (selectedSize != '0') {
                            Provider.of<CartProvider>(context, listen: false)
                                .addProduct(
                              {
                                'id': widget.product['id'],
                                'title': widget.product['title'],
                                'price': widget.product['price'],
                                'imageUrl': widget.product['imageUrl'],
                                'category': widget.product['category'],
                                'size': selectedSize,
                              },
                            );
                              ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Product added Successfully!"),
                              ),
                            );
                          } 
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please select size"),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          minimumSize: const Size(double.infinity, 40),
                        ),
                        child: const Wrap(
                          children: <Widget>[
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.black,
                              size: 24.0,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Add to Cart",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ),
                    ),
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
