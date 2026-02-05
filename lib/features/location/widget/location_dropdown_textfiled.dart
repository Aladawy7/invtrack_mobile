import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class LocationDropdownField extends StatelessWidget {
  final String label;
  final List<String> items;
  final void Function(String?)? onChanged;
  final String? value;

  const LocationDropdownField({
    super.key,
    required this.label,
    required this.items,
    this.onChanged,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Text(label, style: TextStyle(fontSize: 16))],
        ),
        SizedBox(height: 8),
        DropdownButtonFormField2<String>(
          value: value,
          decoration: InputDecoration(border: OutlineInputBorder()),
          isExpanded: true,
          dropdownStyleData: DropdownStyleData(
            direction: DropdownDirection.textDirection,
            maxHeight: 200,
          ),
          items: items
              .map(
                (item) =>
                    DropdownMenuItem<String>(value: item, child: Text(item)),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
