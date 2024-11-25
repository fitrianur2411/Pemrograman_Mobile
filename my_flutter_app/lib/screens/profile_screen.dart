import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengakses AuthProvider dari context
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          // Tombol logout
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Proses logout dan navigasi ke halaman login
              authProvider.logout();
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
      body: Center(
        child: user != null
            // Menampilkan informasi pengguna jika tersedia
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome, ${user.name}!', 
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Email: ${user.email}', style: const TextStyle(fontSize: 16)),
                ],
              )
            // Menampilkan indikator jika data pengguna belum tersedia
            : const CircularProgressIndicator(),
      ),
    );
  }
}
