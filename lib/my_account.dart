import 'package:bee_icecream/bottom_nav_bar.dart';
import 'package:bee_icecream/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  // Controllers for the text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  // Save details
  String savedName = '';
  String savedAddress = '';
  String savedContact = '';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(color: const Color.fromARGB(255, 243, 89, 6)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'My Account',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'a@a.com', // This should come from user data or authentication
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )
                  ],
                ),
              ),

              // Banner image placement
              Image.asset(
                'lib/images/banner.jpeg',
                height: 150,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'My Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              ListOfOption(
                icon: Icon(
                  Icons.person_2_outlined,
                  color: Colors.green,
                ),
                title: 'Name',
                value: savedName.isEmpty ? 'Enter your name' : savedName,
                onTap: () => _editDetails(context, 'Name'),
              ),
              ListOfOption(
                icon: Icon(
                  Icons.location_city_outlined,
                  color: Colors.green,
                ),
                title: 'Address',
                value:
                    savedAddress.isEmpty ? 'Enter your address' : savedAddress,
                onTap: () => _editDetails(context, 'Address'),
              ),
              ListOfOption(
                icon: Icon(
                  Icons.contact_phone_outlined,
                  color: Colors.green,
                ),
                title: 'Contact',
                value:
                    savedContact.isEmpty ? 'Enter your contact' : savedContact,
                onTap: () => _editDetails(context, 'Contact'),
              ),
              ListOfOption(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.green,
                ),
                title: 'Orders',
                onTap: () {
                  // Navigate to orders page (if you have one)
                },
              ),
            ],
          ),
        ),
      ),
      showBottomNavBar: true,
      initialIndex: 2,
    );
  }

  // Method to edit details
  void _editDetails(BuildContext context, String field) {
    switch (field) {
      case 'Name':
        nameController.text = savedName;
        break;
      case 'Address':
        addressController.text = savedAddress;
        break;
      case 'Contact':
        contactController.text = savedContact;
        break;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $field'),
          content: TextField(
            controller: field == 'Name'
                ? nameController
                : field == 'Address'
                    ? addressController
                    : contactController,
            decoration: InputDecoration(hintText: 'Enter your $field'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (field == 'Name') {
                    savedName = nameController.text;
                  } else if (field == 'Address') {
                    savedAddress = addressController.text;
                  } else if (field == 'Contact') {
                    savedContact = contactController.text;
                  }
                });
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class ListOfOption extends StatelessWidget {
  final Icon icon;
  final String title;
  final String value; // Added value parameter to show current saved details
  final VoidCallback onTap;

  const ListOfOption({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.value = '', // Default to empty if no value provided
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      subtitle: Text(value), // Show current value (saved details)
      trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
      onTap: onTap,
    );
  }
}
