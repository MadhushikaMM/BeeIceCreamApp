import 'package:bee_icecream/cart_provider.dart';
import 'package:bee_icecream/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    List<CartItem> cartItems = Provider.of<CartProvider>(context).cartItems;
    double totalAmount =
        cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
            255, 243, 89, 6), // Orange background for "Your Cart"
        title: const Text("Your Cart"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(
                    fontSize: 18, color: const Color.fromARGB(255, 243, 89, 6)),
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(cartItems[index].name),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    Provider.of<CartProvider>(context, listen: false)
                        .cartItems
                        .removeAt(index);
                    Provider.of<CartProvider>(context, listen: false)
                        .notifyListeners();
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 16.0),
                  ),
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          cartItems[index].image,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(cartItems[index].name),
                      subtitle: Text(
                        "Quantity: ${cartItems[index].quantity}, Price: \$${cartItems[index].price}",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              if (cartItems[index].quantity > 1) {
                                cartItems[index].quantity--;
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .notifyListeners();
                              }
                            },
                          ),
                          Text(cartItems[index].quantity.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              cartItems[index].quantity++;
                              Provider.of<CartProvider>(context, listen: false)
                                  .notifyListeners();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 243, 89, 6)),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Checkout"),
                content: const Text("Thank you for your purchase!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      // Clear the cart after the user presses OK
                      Provider.of<CartProvider>(context, listen: false)
                          .clearCart();

                      // Show success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Purchase successful!'),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                        ),
                      );

                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          },
          child: Text("Checkout (\$${totalAmount.toStringAsFixed(2)})"),
        ),
      ),
    );
  }
}
