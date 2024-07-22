import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordsArithmeticsNotifier extends StateNotifier<int> {
  RecordsArithmeticsNotifier() : super(0) {
    // Load the value from shared preferences when the notifier is created
    loadRecord();
  }

  void addRecord(int newRecord) async {
    print('adding record $newRecord');
    if (newRecord > state) {
      state = newRecord;
      await _saveRecord(newRecord);
      print('new record  is $newRecord');
    }
  }

  // Utility method to load the record from shared preferences
  Future<void> loadRecord() async {
    final prefs = await SharedPreferences.getInstance();
    final savedRecord = prefs.getInt('recordOfAr');
    if (savedRecord != null) {
      state = savedRecord;
    }
    print('loading $savedRecord');
  }

  // Utility method to save the record to shared preferences
  Future<void> _saveRecord(int newRecord) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('recordOfAr', newRecord);
  }
}

final arithmeticsRecordsProvider =
    StateNotifierProvider<RecordsArithmeticsNotifier, int>(
        (ref) => RecordsArithmeticsNotifier());
