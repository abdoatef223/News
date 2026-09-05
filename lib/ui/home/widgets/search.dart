import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/resources/assets_manager.dart';

class Search extends StatefulWidget {
  final Function(String) onSearch;
  final VoidCallback onClose;
  const Search({super.key, required this.onSearch, required this.onClose});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController searchController;
  Timer? debounce;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      onChanged: (value) {
        debounce?.cancel();
        debounce = Timer(const Duration(milliseconds: 400), () {
          widget.onSearch(value); // the timer so the onSearch wait till the keystroke stop so the api can return the right result
        });
      },
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: IconButton(onPressed: () {

        }, icon: SvgPicture.asset(AssetsManager.search)),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() => searchController.clear());
            widget.onSearch("");
            widget.onClose();
          },
          icon: SvgPicture.asset(AssetsManager.close),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}