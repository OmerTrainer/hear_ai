// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hear_ai/blocs/bloc/media_bloc.dart';

class MediaFilterDropdown extends StatelessWidget {
  final SelectedFilterValue selectedVal;
  final Function(String) onChangeVal;
  const MediaFilterDropdown(
      {Key? key, required this.onChangeVal, required this.selectedVal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedVal.toString().split('.').last,
      onChanged: (String? newValue) =>
          onChangeVal(newValue ?? selectedVal.toString()),
      items: SelectedFilterValue.values
          .map((value) => value.toString().split('.').last)
          .toList()
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
