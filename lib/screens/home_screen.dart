import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hear_ai/blocs/bloc/media_bloc.dart';
import 'package:hear_ai/models/media_item_model.dart';
import 'package:hear_ai/widgets/filter_menu.dart';
import 'package:hear_ai/widgets/media_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaBloc, MediaState>(
      builder: (context, state) {
        List<MediaItemModel> items = [];
        if (state.selectedFilterValue == SelectedFilterValue.all) {
          items = state.mediaItems;
        }
        if (state.selectedFilterValue == SelectedFilterValue.videos) {
          items = state.mediaItems.where((element) => element.isVideo).toList();
        }
        if (state.selectedFilterValue == SelectedFilterValue.images) {
          items = state.mediaItems
              .where((element) => element.isVideo == false)
              .toList();
        }
        return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, '/upload'),
              child: const Icon(Icons.add),
            ),
            appBar: AppBar(
              title: MediaFilterDropdown(
                selectedVal: state.selectedFilterValue,
                onChangeVal: (newVal) =>
                    context.read<MediaBloc>().add(FilterMedia(
                          filterValue: newVal == 'all'
                              ? SelectedFilterValue.all
                              : newVal == 'videos'
                                  ? SelectedFilterValue.videos
                                  : SelectedFilterValue.images,
                        )),
              ),
            ),
            body: MediaGrid(mediaItems: items));
      },
    );
  }
}
