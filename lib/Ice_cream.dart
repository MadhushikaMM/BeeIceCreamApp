import 'package:bee_icecream/bottom_nav_bar.dart';
import 'package:bee_icecream/custom_scaffold.dart';
import 'package:flutter/material.dart';

class IceCream extends StatelessWidget {
  IceCream({super.key});

  final List<IceCreamItem> iceCreamItems = [
    IceCreamItem(
      image: 'lib/images/rolls.jpg',
      title: 'Chocolate Rolls',
      subtitle: 'Delicious chocolate rolls',
      rating: '4.5 ★',
      price: '\$12',
    ),
    IceCreamItem(
      image: 'lib/images/kottu.jpg',
      title: 'Ice Cream Kottu',
      subtitle: 'Unique ice cream kottu',
      rating: '4.8 ★',
      price: '\$10',
    ),
    IceCreamItem(
      image: 'lib/images/cake1.jpg',
      title: 'Ice Cream Cake',
      subtitle: 'Creamy ice cream cake',
      rating: '4.6 ★',
      price: '\$15',
    ),
    IceCreamItem(
      image: 'lib/images/biscuits.jpg',
      title: 'Ice Cream Biscuits',
      subtitle: 'Crunchy and sweet',
      rating: '4.7 ★',
      price: '\$8',
    ),
    IceCreamItem(
      image: 'lib/images/sandwich.jpg',
      title: 'Ice Cream Sandwich',
      subtitle: 'Cool and tasty',
      rating: '4.9 ★',
      price: '\$9',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Search Box
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 243, 89, 6),
              ),
              child: Container(
                color: Colors.white,
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Search Ice Cream',
                          hintStyle:
                              TextStyle(fontSize: 12.0, color: Colors.grey),
                          border: InputBorder.none,
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_list),
                    ),
                  ],
                ),
              ),
            ),
            // ListView to Display Items in Single Column
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: iceCreamItems.length,
                itemBuilder: (context, index) {
                  return buildCard(iceCreamItems[index]);
                },
              ),
            ),
          ],
        ),
      ),
      showBottomNavBar: true,
      initialIndex: 1,
    );
  }

  // Method to Build Each Card
  Widget buildCard(IceCreamItem item) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.asset(
              item.image,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Title, Subtitle, Rating, and Price
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.rating,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Model class for Ice Cream Items
class IceCreamItem {
  final String image;
  final String title;
  final String subtitle;
  final String rating;
  final String price;

  IceCreamItem({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.price,
  });
}
