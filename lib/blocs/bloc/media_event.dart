part of 'media_bloc.dart';

sealed class MediaEvent extends Equatable {
  const MediaEvent();

  @override
  List<Object> get props => [];
}

class AddMedia extends MediaEvent {
  final MediaItemModel mediaItem;
  const AddMedia({required this.mediaItem});

  @override
  List<Object> get props => [mediaItem];
}

class DeleteMedia extends MediaEvent {
  final String mediaItemId;
  const DeleteMedia({required this.mediaItemId});

  @override
  List<Object> get props => [mediaItemId];
}

class FetchMedia extends MediaEvent {
  const FetchMedia();

  @override
  List<Object> get props => [];
}

class FilterMedia extends MediaEvent {
  final SelectedFilterValue filterValue;

  const FilterMedia({required this.filterValue});

  @override
  List<Object> get props => [filterValue];
}
