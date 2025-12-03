import 'package:flutter/material.dart';
import 'package:union_shop/main.dart'; // for cartItems

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get totalPrice => cartItems.fold(
      0, (sum, item) => sum + (item.product.price * item.quantity));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart')),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty.'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        leading: Image.asset(item.product.image,
                            width: 48, height: 48),
                        title: Text(item.product.title),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Size: ${item.selectedSize ?? "-"} | Color: ${item.selectedColor ?? "-"}'),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: item.quantity > 1
                                      ? () {
                                          setState(() {
                                            item.quantity--;
                                          });
                                        }
                                      : null,
                                ),
                                Text('${item.quantity}',
                                    style: const TextStyle(fontSize: 16)),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      item.quantity++;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Text(
                              'Subtotal: £${(item.product.price * item.quantity).toStringAsFixed(2)}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              cartItems.removeAt(index);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('Total: £${totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          cartItems.clear();
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Order Placed'),
                              content:
                                  const Text('Your order has been placed!'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                          setState(() {});
                        },
                        child: const Text('Place Order'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
