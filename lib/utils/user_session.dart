import 'package:shared_preferences/shared_preferences.dart';

class UserSession {
  static final UserSession _instance = UserSession._internal();
  late SharedPreferences _prefs;

  factory UserSession() {
    return _instance;
  }

  UserSession._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // --- Fungsi Login (DIGANTI) ---
  Future<void> login(String userId, String email) async {
    await _prefs.setString('userId', userId);
    await _prefs.setString('email', email); // <-- Diubah
  }

  Future<void> logout() async {
    await _prefs.remove('userId');
    await _prefs.remove('email'); // <-- Diubah
  }

  bool isLoggedIn() {
    return _prefs.getString('userId') != null;
  }

  // --- Ganti dari getUsername() menjadi getEmail() ---
  String? getEmail() {
    return _prefs.getString('email'); // <-- Diubah
  }

  // --- Fungsi Favorit (Tetap sama) ---
  List<String> getFavorites() {
    return _prefs.getStringList('favorites') ?? [];
  }

  bool isFavorite(String novelId) {
    return getFavorites().contains(novelId);
  }

  Future<void> toggleFavorite(String novelId) async {
    List<String> favorites = getFavorites();
    if (favorites.contains(novelId)) {
      favorites.remove(novelId);
    } else {
      favorites.add(novelId);
    }
    await _prefs.setStringList('favorites', favorites);
  }
  
}