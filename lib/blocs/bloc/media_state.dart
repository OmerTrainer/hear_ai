part of 'media_bloc.dart';

enum SelectedFilterValue { all, videos, images }

class MediaState extends Equatable {
  final List<MediaItemModel> mediaItems;
  final SelectedFilterValue selectedFilterValue;
  const MediaState(
      {required this.mediaItems, required this.selectedFilterValue});

  @override
  List<Object> get props => [mediaItems, selectedFilterValue];
}
