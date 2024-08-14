import 'package:flutter/material.dart';
import 'package:jmp_3/home_page.dart';
import 'package:jmp_3/order_page.dart';

class BakeryItemDetailPage extends StatelessWidget {
  final BakeryItem item;

  const BakeryItemDetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: Color.fromARGB(255, 231, 155, 101),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                item.imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              item.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 196, 117, 61),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item.price,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 16),
            // Tambahkan deskripsi jika diperlukan
            Text(
              '${item.description}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderPage(item: item),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.brown, // Mengubah warna background tombol
                textStyle: const TextStyle(
                  fontSize: 18, // Mengubah ukuran teks pada tombol
                  fontWeight: FontWeight.bold,
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15), // Mengubah padding tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20), // Mengubah rounding ujung tombol
                ),
              ),
              child: const Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}
