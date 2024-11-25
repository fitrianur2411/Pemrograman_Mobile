import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  /// Mengecek status login dan mengarahkan pengguna ke halaman yang sesuai
  void _checkLoginStatus() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    await authProvider.loadUser();

    if (authProvider.user != null) {
      // Jika pengguna sudah login, arahkan ke halaman profil
      Navigator.of(context).pushReplacementNamed('/profile');
    } else {
      // Jika pengguna belum login, arahkan ke halaman login
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'My Flutter App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi manual ke halaman login
                Navigator.of(context).pushReplacementNamed('/login');
              },
              child: Text('Go to Login'),
            ),
          ],
        ),
      ),
    );
  }


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Text(
  //         'My Flutter App',
  //         style: TextStyle(
  //           fontSize: 24,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
