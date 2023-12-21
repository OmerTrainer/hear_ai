import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hear_ai/blocs/bloc/media_bloc.dart';
import 'package:hear_ai/models/media_item_model.dart';

class MediaCard extends StatelessWidget {
  final MediaItemModel mediaItem;

  const MediaCard({Key? key, required this.mediaItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.file(
              File(mediaItem.mediaUrl),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(mediaItem.description),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async => context
                .read<MediaBloc>()
                .add(DeleteMedia(mediaItemId: mediaItem.id)),
          ),
        ],
      ),
    );
  }
}
