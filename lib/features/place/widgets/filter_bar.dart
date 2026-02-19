import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  final String filter;
  final ValueChanged<String> onFilterChanged;
  final String search;
  final ValueChanged<String> onSearchChanged;

  const FilterBar({
    Key? key,
    required this.filter,
    required this.onFilterChanged,
    required this.search,
    required this.onSearchChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: filter,
              items: const [
                DropdownMenuItem(value: 'الكل', child: Text('الكل')),
                DropdownMenuItem(value: 'سليمة', child: Text('سليمة')),
                DropdownMenuItem(value: 'تلف', child: Text('تالف')),
              ],
              onChanged: (v) {
                if (v != null) onFilterChanged(v);
              },
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              hintText: 'ابحث عن عهدة',
              suffixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: onSearchChanged,
          ),
        ),
      ],
    );
  }
}
