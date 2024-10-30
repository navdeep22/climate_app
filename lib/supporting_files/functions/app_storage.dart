import 'package:climate_app/supporting_files/app_globals/app_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static var favoriteListKey = AppKeys.favoriteList;
  static Future<void> appendToFavoriteList(String newItem) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> existingList = prefs.getStringList(favoriteListKey) ?? [];
    existingList.add(newItem);
    await prefs.setStringList(favoriteListKey, existingList);
  }

  static Future<List<String>> fetchFavoriteList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(favoriteListKey) ?? [];
  }

  static Future<void> removeFavoriteList(String itemToRemove) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> existingList = prefs.getStringList(favoriteListKey) ?? [];
    existingList.remove(itemToRemove);
    await prefs.setStringList(favoriteListKey, existingList);
  }

  static Future<bool> isFavorite(String item) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> existingList = prefs.getStringList(favoriteListKey) ?? [];
    return existingList
        .any((element) => element.toLowerCase() == item.toLowerCase());
  }
}
