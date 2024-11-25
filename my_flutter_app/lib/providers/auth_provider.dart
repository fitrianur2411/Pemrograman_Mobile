import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService(); // Instance dari AuthService
  User? _user; // Menyimpan data pengguna yang sedang login

  /// Getter untuk mendapatkan data pengguna
  User? get user => _user;

  /// Login user dan simpan profil pengguna jika berhasil
  Future<bool> login(String email, String password) async {
    bool success = await _authService.login(email, password);
    if (success) {
      _user = await _authService.getProfile();
      notifyListeners(); // Beritahu listener bahwa data user telah diperbarui
    }
    return success;
  }

  /// Logout user dan hapus data pengguna dari state
  Future<void> logout() async {
    await _authService.logout();
    _user = null; // Hapus data user
    notifyListeners(); // Beritahu listener bahwa data user telah dihapus
  }

  /// Memuat profil pengguna jika belum dimuat
  /// 
  Future<void> loadUser() async {
    try {
      _user = await _authService.getProfile();
      notifyListeners();
    } catch (e) {
      print("Error loading user: $e");
    }
  }
 
  // Future<void> loadUser() async {
  //   _user = await _authService.getProfile();
  //   notifyListeners(); // Beritahu listener bahwa data user telah dimuat
  // }
}
