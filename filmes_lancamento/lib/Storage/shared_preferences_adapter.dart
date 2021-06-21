import 'dart:math';

import 'package:filmes_lancamento/Storage/internal_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter extends InternalStorageAdapter {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool isFav = false;
  bool isDupli = false;

  void addFavoriteMovie(int id) async {
    final internalPref = await _prefs;

    internalPref.getKeys().forEach((element) {
      if (internalPref.getInt(element) == id) {
        isDupli = true;
      }
    });

    if (!isDupli) {
      int rand = Random().nextInt(999);
      while (internalPref.containsKey('id$rand')) {
        rand = Random().nextInt(999);
      }
      internalPref.setInt('id$rand', id);
      isFav = true;
    }
  }

  void removeFavoriteMovie(int id) async {
    final internalPref = await _prefs;

    internalPref.getKeys().forEach((element) {
      if (internalPref.getInt(element) == id) {
        internalPref.remove(element);
        isFav = false;
      }
    });
  }

  Future<bool> isFavorite(int id) async {
    final internalPref = await _prefs;

    internalPref.getKeys().forEach((element) {
      if (internalPref.getInt(element) == id) {
        isFav = true;
      }
    });

    return isFav;
  }
}
