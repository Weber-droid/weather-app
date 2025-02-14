import 'package:flutter/material.dart';

class SearchBarr extends StatelessWidget {
  final Function(String) onSearch;

  const SearchBarr({required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter city name',
        border: OutlineInputBorder(),
      ),
      onSubmitted: onSearch,
    );
  }
}