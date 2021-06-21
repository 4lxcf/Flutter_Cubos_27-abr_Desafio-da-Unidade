import 'package:filmes_lancamento/Storage/internal_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter extends InternalStorageAdapter {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int idCount = 0;
  bool isDupli = false;

  void addFavoriteMovie(int id) async {
    final internalPref = await _prefs;
    idCount = internalPref.getKeys().length + 1;

    internalPref.getKeys().forEach((element) {
      if (internalPref.getInt(element) == id) {
        isDupli = true;
        return;
      }
    });

    if (!isDupli) {
      internalPref.setInt('id$idCount', id);
    }
  }

  void removeFavoriteMovie(int id) async {
    final internalPref = await _prefs;
    //internalPref.remove('id$idCount');
    //print(internalPref.getInt('id$idCount'));
    //print(internalPref.getKeys().length);
  }

  Future<bool> isFavorite(int id) async {}
}
