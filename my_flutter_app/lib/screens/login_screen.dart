import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  // Kontroller untuk input email dan password
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Mengakses AuthProvider dari context
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input email
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            // Input password
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            // Tombol login
            ElevatedButton(
              onPressed: () async {
                // Proses login
                bool success = await authProvider.login(
                  emailController.text,
                  passwordController.text,
                );
                if (success) {
                  // Navigasi ke halaman profil jika login berhasil
                  Navigator.of(context).pushReplacementNamed('/profile');
                } else {
                  // Menampilkan pesan jika login gagal
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login failed!')),
                  );
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
