import 'package:flutter/material.dart';

import 'package:search_bar_challenge/constants/colors.dart';
import 'package:search_bar_challenge/data/member_data.dart';
import 'package:search_bar_challenge/helpers/search_helper.dart';
import 'package:search_bar_challenge/presentation/widgets/custom_app_bar.dart';
import 'package:search_bar_challenge/presentation/widgets/custom_data_table.dart';
import 'package:search_bar_challenge/presentation/widgets/custom_search_bar.dart';
import 'package:search_bar_challenge/presentation/widgets/custom_segmented_control.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String selectedValue = 'name';
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredPeople = SearchHelper.filterPeople(
      people: personData,
      searchText: searchText,
      selectedValue: selectedValue,
    );

    return Scaffold(
      backgroundColor: white,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 12, left: 24, right: 24),
          child: Column(
            children: [
              CustomSearchBar(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              CustomSegmentedControl(
                selectedValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),

              const SizedBox(height: 24),

              CustomDataTable(people: filteredPeople),
            ],
          ),
        ),
      ),
    );
  }
}
