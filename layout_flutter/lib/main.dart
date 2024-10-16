import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Membuat widget titleSection
    Widget titleSection = Container(
      padding: const EdgeInsets.all(
          32), // padding sepanjang tepinya sebesar 32 piksel
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Telaga Sarangan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Indonesia',
                  style: TextStyle(
                    color: Colors.grey, // Warna teks diatur menjadi abu-abu
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.star,
            color: Colors.red, // Warna ikon bintang diatur ke merah
          ),
          const Text('41'),
        ],
      ),
    );

    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    // Mendapatkan warna tema dan membuat buttonSection
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Telaga Sarangan adalah telaga yang terbentuk secara alami, dan berada di ketinggian 1.200 Mdpl. Tepatnya berada di lereng Gunung Lawu, Kabupaten Magetan, Jawa Timur. Luas dari telaga ini mencapai 30 hektar, dengan kedalaman danau 28 meter.'
        'Alam yang begitu indah dan asri, di mana danau sangat jernih dan bersih. Di sekeliling danau terdapat pegunungan dan pepohonan yang hijau dan tinggi. Bahkan, terkadang gunung, pepohonan, dan langit memantul dengan indah di permukaan danau.'
        '\n\n'
        'Fitria Nur Sholikah - 2241760004',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: Fitria Nur - 2241760004',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/TelagaSarangan.jpeg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection, // Menampilkan widget titleSection
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}