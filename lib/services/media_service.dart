import 'dart:convert';
import 'package:hear_ai/models/media_item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MediaService {
  static const String keyMediaItems = 'mediaItems';

  Future<void> saveMediaItem(MediaItemModel mediaItem) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mediaItemsStringList =
        prefs.getStringList(keyMediaItems) ?? [];
    mediaItemsStringList.add(json.encode(mediaItem.toMap()));
    prefs.setStringList(keyMediaItems, mediaItemsStringList);
  }

  Future<List<MediaItemModel>> getMediaItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mediaItemsStringList =
        prefs.getStringList(keyMediaItems) ?? [];
    return mediaItemsStringList
        .map((item) => MediaItemModel.fromMap(json.decode(item)))
        .toList();
  }

  Future<void> deleteMediaItem(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mediaItemsStringList =
        prefs.getStringList(keyMediaItems) ?? [];
    mediaItemsStringList.removeWhere(
        (item) => MediaItemModel.fromMap(json.decode(item)).id == id);
    prefs.setStringList(keyMediaItems, mediaItemsStringList);
  }
}
