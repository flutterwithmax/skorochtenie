import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserNotifier extends StateNotifier<String?> {
  UserNotifier() : super(null) {
    loadUserName();
  }

  Future<void> loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getString('userName');
  }

  Future<void> setName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    state = name;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, String?>((ref) {
  return UserNotifier();
});
