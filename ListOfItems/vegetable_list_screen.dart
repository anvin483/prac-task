import 'package:flutter/material.dart';
import 'vegetable_detail_screen.dart';

class VegetableListScreen extends StatelessWidget {
  const VegetableListScreen({super.key});

  // List of vegetables with name, image, and description
  final List<Map<String, String>> vegetables = const [
    {
      "name": "Carrot",
      "image": "https://www.trustbasket.com/cdn/shop/articles/Carrot.jpg?v=1688378789",
      "desc": "Carrots are rich in beta carotene, fiber, and vitamin A. They help improve vision and boost immunity."
    },
    {
      "name": "Tomato",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1Z1S6Mzj_R6t7iT2IqBfGnS45SJg3vQ79F1LUnpqTPQW_nNFYzk6fZs6Joqo&s",
      "desc": "Tomatoes are a great source of antioxidants and vitamin C. They are used widely in cooking and salads."
    },
    {
      "name": "Potato",
      "image": "https://www.potsandpans.in/cdn/shop/articles/Copy_of_Blog_Templates_-_2023-04-19T172330.892_1296x.png?v=1681905241",
      "desc": "Potatoes are a staple food rich in carbohydrates and potassium, often used for fries, mashed, or baked dishes."
    },
    {
      "name": "Broccoli",
      "image": "https://images.squarespace-cdn.com/content/v1/5b5aa0922487fd1ce32c117a/1547765015801-FSR1DVSKCZU3PAYWIRQG/broccoli.jpg?format=1000w",
      "desc": "Broccoli is a cruciferous vegetable loaded with fiber, vitamins C and K, and cancer-fighting compounds."
    },
    {
      "name": "Spinach",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeo18MPQgxRSw8PEQP1NR9UxyTYhveHlEIFqpkWdrrkoQyqMFWLDMc-AbmuPI&s",
      "desc": "Spinach is an iron-rich leafy green vegetable that boosts energy and supports healthy skin and bones."
    },
    {
      "name": "Cabbage",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKk0bb49J5X0xkTu6UfTMkqOihMrDIyIWE57dUR7kaxQXkmIR-srnpSf3jHnY&s",
      "desc": "Cabbage is high in fiber and vitamin C, often used in salads and traditional dishes like sauerkraut."
    },
    {
      "name": "Cauliflower",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0dZAjN7TGsMgYBFCPT-cc8-q_VA88tAetvxJwEgT6btM7hsCIW7usmn8MT1U&s",
      "desc": "Cauliflower is a versatile low-carb vegetable used in soups, salads, and even as a rice alternative."
    },
    {
      "name": "Brinjal (Eggplant)",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRJcKrF7uiQqYQIBr9nWDodzj5fIrbZS3lzjLEE8d3xhNO4vpnTbj_qqb54Q&s",
      "desc": "Eggplants are rich in fiber and antioxidants, used in various cuisines such as curries and roasted dishes."
    },
    {
      "name": "Pumpkin",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQInofcIqdQWNI81ABxqXQbY7DCvppvRGC5SnZ3v2wufwDvGjb7Qg-__i9c5g&s",
      "desc": "Pumpkins are rich in vitamins A and E, used in soups, pies, and festive dishes."
    },
    {
      "name": "Onion",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuF_khQin65E-1BtInnkU_MvDIxRjI4pWLZmb2yKahi1MGHg6C4GHUXVJUA1s&s",
      "desc": "Onions add flavor to almost every dish and contain compounds that may help reduce inflammation."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vegetable List 🥦"),
        backgroundColor: Colors.green[700],
      ),
      backgroundColor: Colors.green[50],
      body: ListView.builder(
        itemCount: vegetables.length,
        itemBuilder: (context, index) {
          final veg = vegetables[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(veg["image"]!),
              ),
              title: Text(
                veg["name"]!,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                // Navigate to detail page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VegetableDetailScreen(vegetable: veg),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
