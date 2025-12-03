import 'package:flutter/material.dart';

class CollectionFilterBar extends StatelessWidget {
  final List<String> filterOptions;
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;
  final List<String> sortOptions;
  final String selectedSort;
  final ValueChanged<String> onSortChanged;

  const CollectionFilterBar({
    super.key,
    required this.filterOptions,
    required this.selectedFilter,
    required this.onFilterChanged,
    required this.sortOptions,
    required this.selectedSort,
    required this.onSortChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Filter: '),
        DropdownButton<String>(
          value: selectedFilter,
          items: filterOptions
              .map((f) => DropdownMenuItem(value: f, child: Text(f)))
              .toList(),
          onChanged: (val) => onFilterChanged(val!),
        ),
        const SizedBox(width: 24),
        const Text('Sort: '),
        DropdownButton<String>(
          value: selectedSort,
          items: sortOptions
              .map((s) => DropdownMenuItem(value: s, child: Text(s)))
              .toList(),
          onChanged: (val) => onSortChanged(val!),
        ),
      ],
    );
  }
}
