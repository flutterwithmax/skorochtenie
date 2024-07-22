import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordsNotifier extends StateNotifier<double> {
  RecordsNotifier() : super(0.0) {
    // Load the value from shared preferences when the notifier is created
    loadRecord();
  }

  void addRecord(double newRecord) async {
    print('adding record $newRecord');
    if (newRecord < state || newRecord > 0) {
      state = newRecord;
      await _saveRecord(newRecord);
      print('new record  is $newRecord');
    }
  }

  // Utility method to load the record from shared preferences
  Future<void> loadRecord() async {
    final prefs = await SharedPreferences.getInstance();
    final savedRecord = prefs.getDouble('record');
    if (savedRecord != null) {
      state = savedRecord;
    }
    print('loading $savedRecord');
  }

  // Utility method to save the record to shared preferences
  Future<void> _saveRecord(double newRecord) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('record', newRecord);
  }
}

final userRecordsProvider =
    StateNotifierProvider<RecordsNotifier, double>((ref) => RecordsNotifier());
