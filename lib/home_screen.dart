import 'package:bee_icecream/bottom_nav_bar.dart';
import 'package:bee_icecream/custom_scaffold.dart';
import 'package:bee_icecream/product_details.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CardItem> cardItems = [];
  List<CardItem> filteredItems = [];
  String searchText = '';

  @override
  void initState() {
    super.initState();
    cardItems = [
      CardItem(
          title: 'Ice Cream Drinks',
          pricing: '\$5',
          images: 'lib/images/drink.jpg'),
      CardItem(
          title: 'Fruit Ice Cream',
          pricing: '\$5',
          images: 'lib/images/fruit.jpg'),
      CardItem(
          title: 'Ice Cream Cake',
          pricing: '\$6',
          images: 'lib/images/cake.jpg'),
      CardItem(
          title: 'Ice Cream Towers',
          pricing: '\$8',
          images: 'lib/images/tower.jpg'),
      CardItem(
          title: 'Avocado flavor',
          pricing: '\$10',
          images: 'lib/images/item1.jpg'),
      CardItem(
          title: 'Pineapple flavor',
          pricing: '\$10',
          images: 'lib/images/item2.jpg'),
      CardItem(
          title: 'Gee flavor', pricing: '\$10', images: 'lib/images/item3.jpg'),
      CardItem(
          title: 'Orange flavor',
          pricing: '\$10',
          images: 'lib/images/item4.jpg'),
      CardItem(
          title: 'Mix Fruit', pricing: '\$10', images: 'lib/images/item5.png'),
      CardItem(
          title: '3 flavor', pricing: '\$8', images: 'lib/images/item6.jpg'),
      CardItem(title: 'Fancy', pricing: '\$15', images: 'lib/images/item7.jpg'),
      CardItem(
          title: 'Signature Bee1',
          pricing: '\$12',
          images: 'lib/images/item10.jpg'),
      CardItem(
          title: 'Signature Bee2',
          pricing: '\$12',
          images: 'lib/images/item11.jpg'),
      CardItem(
          title: 'Signature Bee3',
          pricing: '\$12',
          images: 'lib/images/item12.jpg'),
      CardItem(
          title: 'Signature Bee4',
          pricing: '\$12',
          images: 'lib/images/item13.jpg'),
      CardItem(
          title: 'Signature Bee5',
          pricing: '\$12',
          images: 'lib/images/item14.jpg'),
      CardItem(
          title: 'Signature Bee6',
          pricing: '\$12',
          images: 'lib/images/item15.jpg'),
      CardItem(
          title: 'Signature Bee7',
          pricing: '\$12',
          images: 'lib/images/item16.jpg'),
      CardItem(
          title: 'Signature Bee8',
          pricing: '\$12',
          images: 'lib/images/item17.jpg'),
      CardItem(
          title: 'Signature Bee9',
          pricing: '\$12',
          images: 'lib/images/item18.jpg'),
      CardItem(
          title: 'Signature Bee10',
          pricing: '\$12',
          images: 'lib/images/item19.jpg'),
    ];
    filteredItems = List.from(cardItems);
  }

  void updateSearchResults(String value) {
    setState(() {
      searchText = value.toLowerCase();
      filteredItems = cardItems
          .where((item) => item.title.toLowerCase().contains(searchText))
          .toList();
    });
  }

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
                        onChanged: updateSearchResults,
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
            // GridView for Cards
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: filteredItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return buildCard(filteredItems[index]);
                },
              ),
            ),
          ],
        ),
      ),
      showBottomNavBar: true,
      initialIndex: 0,
    );
  }

  // Method to build a card
  Widget buildCard(CardItem cardItem) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(
              title: cardItem.title,
              pricing: cardItem.pricing,
              image: cardItem.images,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
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
                cardItem.images,
                height: 130,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Title and Pricing
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardItem.title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    cardItem.pricing,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color.fromARGB(255, 19, 11, 0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Model class for card items
class CardItem {
  final String title;
  final String pricing;
  final String images;

  CardItem({required this.title, required this.pricing, required this.images});
}
