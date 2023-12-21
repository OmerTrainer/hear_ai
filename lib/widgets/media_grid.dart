import 'package:flutter/material.dart';
import 'package:hear_ai/models/media_item_model.dart';
import 'package:hear_ai/widgets/media_card.dart';

class MediaGrid extends StatelessWidget {
  final List<MediaItemModel> mediaItems;

  const MediaGrid({Key? key, required this.mediaItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: mediaItems.length,
      itemBuilder: (context, index) {
        return MediaCard(mediaItem: mediaItems[index]);
      },
    );
  }
}
