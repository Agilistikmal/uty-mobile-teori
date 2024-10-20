import 'package:flutter/material.dart';
import 'package:uty_mobile_teori/models/food_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Membuat list/daftar menu makanan untuk ditampilkan
    // Ini menggunakan model Food yang ada di lib/models/food_model.dart
    List<Food> foods = [
      Food(
        name: "Sate Padang",
        imagePath: "assets/sate.jpg",
        description: "Sate Ayam khas Padang",
        price: 18000,
      ),
      Food(
        name: "Nasi Kuning",
        imagePath: "assets/naskun.jpg",
        description: "Nasi Kuning Komplit",
        price: 12000,
      ),
      Food(
        name: "Ayam Bakar",
        imagePath: "assets/ayam.jpg",
        description: "Ayam Bakar Madu",
        price: 32000,
      ),
      Food(
        name: "Mie Ayam",
        imagePath: "assets/mie.jpg",
        description: "Mie Ayam Boyolali",
        price: 15000,
      ),
      Food(
        name: "Soto Ayam",
        imagePath: "assets/soto.jpg",
        description: "Soto Ayam",
        price: 17000,
      ),
    ];

    return MaterialApp(
      home: Scaffold(
        // AppBar menampilkan tulisan Food App
        // dengan background Orange dibagian atas
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Food App",
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.orange,
        ),
        body: Column(
          children: [
            // SizedBox berguna sebagai spasi
            const SizedBox(
              height: 24,
            ),
            // Padding simetris untuk memberi jarak antara horizontal dan vertical
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              // ClipRRect digunakan agar gambar bisa diberi border radius
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                // Sebelum menambah image, pastikan settingan di pubspec.yaml sudah ditambahkan folder assets
                child: const Image(
                  image: AssetImage("assets/food1.jpg"),
                ),
              ),
            ),
            // SizedBox memberi jarak lagi antara banner dan listview setelah ini
            const SizedBox(
              height: 24,
            ),
            // Listview harus dibungkus dengan Expanded
            // jika parent sebelumnya adalah Column
            Expanded(
              child: ListView.builder(
                itemCount: foods.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    // Row digunakan untuk membuat children muncul secara
                    // horizontal berurutan
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image(
                            image: AssetImage(foods[index].imagePath),
                            // Mengatur fit image agar mengcover keseluruhan
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        // Column agar widget tampil secara vertical berurutan
                        Column(
                          // Cross Axis membuat alignment text mulai dari kiri
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              foods[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(foods[index].description),
                            Text(
                              "Rp${foods[index].price}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // ini untuk menghilangkan tanda debug pada kanan atas
      debugShowCheckedModeBanner: false,
    );
  }
}
