import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hear_ai/models/media_item_model.dart';
import 'package:hear_ai/services/media_service.dart';

part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  final MediaService _mediaService;
  MediaBloc(this._mediaService)
      : super(const MediaState(
            mediaItems: [], selectedFilterValue: SelectedFilterValue.all)) {
    on<FetchMedia>(_fetchMedia);
    on<AddMedia>(_addMedia);
    on<DeleteMedia>(_deleteMedia);
    on<FilterMedia>(_filterMedia);
  }

  void _fetchMedia(FetchMedia event, Emitter<MediaState> emit) async {
    List<MediaItemModel> items = await _mediaService.getMediaItems();
    emit(MediaState(
        mediaItems: items, selectedFilterValue: state.selectedFilterValue));
  }

  void _addMedia(AddMedia event, Emitter<MediaState> emit) async {
    List<MediaItemModel> curretItems = [...state.mediaItems];
    curretItems.add(event.mediaItem);
    _mediaService.saveMediaItem(event.mediaItem);
    emit(MediaState(
        mediaItems: curretItems,
        selectedFilterValue: state.selectedFilterValue));
  }

  void _deleteMedia(DeleteMedia event, Emitter<MediaState> emit) async {
    List<MediaItemModel> curretItems = [...state.mediaItems];
    curretItems.removeWhere((element) => element.id == event.mediaItemId);
    _mediaService.deleteMediaItem(event.mediaItemId);
    emit(MediaState(
        mediaItems: curretItems,
        selectedFilterValue: state.selectedFilterValue));
  }

  void _filterMedia(FilterMedia event, Emitter<MediaState> emit) async {
    emit(MediaState(
        mediaItems: state.mediaItems, selectedFilterValue: event.filterValue));
  }
}
