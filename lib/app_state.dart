import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _displayName = prefs.getStringList('ff_displayName') ?? _displayName;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  double _incrementCount = 0.0;
  double get incrementCount => _incrementCount;
  set incrementCount(double value) {
    _incrementCount = value;
  }

  List<String> _displayName = [];
  List<String> get displayName => _displayName;
  set displayName(List<String> value) {
    _displayName = value;
    prefs.setStringList('ff_displayName', value);
  }

  void addToDisplayName(String value) {
    displayName.add(value);
    prefs.setStringList('ff_displayName', _displayName);
  }

  void removeFromDisplayName(String value) {
    displayName.remove(value);
    prefs.setStringList('ff_displayName', _displayName);
  }

  void removeAtIndexFromDisplayName(int index) {
    displayName.removeAt(index);
    prefs.setStringList('ff_displayName', _displayName);
  }

  void updateDisplayNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    displayName[index] = updateFn(_displayName[index]);
    prefs.setStringList('ff_displayName', _displayName);
  }

  void insertAtIndexInDisplayName(int index, String value) {
    displayName.insert(index, value);
    prefs.setStringList('ff_displayName', _displayName);
  }

  String _combinedText = '';
  String get combinedText => _combinedText;
  set combinedText(String value) {
    _combinedText = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
