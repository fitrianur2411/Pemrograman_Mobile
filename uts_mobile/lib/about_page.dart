import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade100, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ],
                ),
                 child: Image.asset(
                      'assets/skincare_icon.jpg', // Replace with your skincare icon path
                      height: 80, // Adjust the size if necessary
                 )
              ),
              const SizedBox(height: 40),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        'Aplikasi UTS',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 152, 78, 134),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Aplikasi ini dibuat untuk memenuhi tugas projek mobile '
                        'terdapat login page , landing page ,Halaman Utama , profile page , dan Halaman ini yaitu halaman About '
                        'dan juga memiliki tampilan responsive',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 20),
                      // Features section
                      const Text(
                        'Fitur yang ada di aplikasi',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 129, 64, 124),
                        ),
                      ),
                      const SizedBox(height: 15),
                      buildFeatureItem(
                        icon: Icons.security,
                        title: 'Keamanan Login',
                        description: 'Aplikasi memiliki sistem login agar aman',
                      ),
                      buildFeatureItem(
                        icon: Icons.phone_android,
                        title: 'Tampilan Responsive',
                        description: 'Tampilan responsif agar pengguna tetap merasa nyaman',
                      ),
                      buildFeatureItem(
                        icon: Icons.gradient,
                        title: 'UI menarik',
                        description: 'Memiliki Ui menarik yang membuat user cukup nyaman',
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 20),
                      // Version info
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  size: 16,
                                  color: Color.fromARGB(255, 126, 73, 107),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Version 1.0.0',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 152, 97, 130),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFeatureItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.pink.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color.fromARGB(255, 158, 97, 122)),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
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