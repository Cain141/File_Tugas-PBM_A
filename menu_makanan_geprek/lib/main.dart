import 'package:flutter/material.dart';
import 'package:menu_makanan_geprek/food_menu.dart';
import 'package:menu_makanan_geprek/cart_item.dart';
import 'package:menu_makanan_geprek/cart_page.dart';
import 'detailPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Selamat datang di Warung Makan Geprek Kami!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuPage()),
                );
              },
              child: const Text('Menu'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
              child: const Text('About'),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // Daftar contoh menu makanan
  List<FoodMenu> foodMenus = [
    FoodMenu(
      imageUrl: 'images/menu-1.png',
      name: 'Nasi Ayambakar + sambel geperek',
      price: 35,
    ),
    FoodMenu(
      imageUrl: 'images/menu-2.jpg',
      name: 'geprek + mie sambel ijo',
      price: 28,
    ),
    FoodMenu(
      imageUrl: 'images/menu-3.jpg',
      name: 'geprek + mie sambal matah',
      price: 28,
    ),
    FoodMenu(
      imageUrl: 'images/menu-4.jpg',
      name: 'geprek + mie sambal merah',
      price: 28,
    ),
    FoodMenu(
      imageUrl: 'images/menu-5.jpg',
      name: 'geprek sambal matah',
      price: 25,
    ),
    FoodMenu(
      imageUrl: 'images/menu-6.jpg',
      name: 'geprek sambal ijo',
      price: 25,
    ),
  ];

  List<CartItem> cartItems = [];

  // Fungsi untuk menambahkan menu ke keranjang
  void addToCart(FoodMenu foodMenu) {
    bool found = false;
    for (var item in cartItems) {
      if (item.foodMenu == foodMenu) {
        item.quantity++;
        found = true;
        break;
      }
    }

    if (!found) {
      cartItems.add(CartItem(foodMenu: foodMenu));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartPage(cartItems: cartItems)),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: foodMenus.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuDetailPage(
                    foodMenu: foodMenus[index],
                    cartItems: cartItems,
                    addToCart: addToCart,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 5.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      foodMenus[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          foodMenus[index].name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('\$${foodMenus[index].price.toStringAsFixed(2)}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CartPage(cartItems: cartItems)),
          );
        },
        label: const Text('Lihat Keranjang'),
        icon: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  final String restaurantExteriorUrl =
      'https://images.unsplash.com/photo-1587899897387-091ebd01a6b2?ixlib=rb-4.0.3&ixid=MnwxMjA3';
  final String restaurantInteriorUrl =
      'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.03&ixid=MnwxMjA3';
  final String restaurantName = 'Italy Restourant';
  final String restaurantLocation =
      'RR74+9RH Kota Bambu Sel., Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta';
  final String mapsUrl = 'https://maps.app.goo.gl/zVXNm5DiE3iyaxuP9';

  AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurantName,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text('Foto Luar Restoran: '),
              const SizedBox(height: 8),
              Image.network(restaurantExteriorUrl),
              const SizedBox(height: 16),
              const Text('Foto Interior Restoran: '),
              const SizedBox(height: 8),
              Image.network(restaurantInteriorUrl),
              const SizedBox(height: 16),
              const Text(
                'Lokasi: ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(restaurantLocation),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () async {
                  await launch(mapsUrl);
                },
                icon: const Icon(Icons.map),
                label: const Text("Buka di Google Maps"),
              )
            ],
          ),
        ),
      ),
    );
  }

  launch(String mapsUrl) {}
}
