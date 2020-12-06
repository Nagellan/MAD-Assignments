import 'package:flutter/material.dart';

class Select extends StatelessWidget {
  final String value;
  final String label;
  final List<String> items;
  final void Function(String) onChanged;

  Select({this.value, this.label, this.items, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      items: items
          .map<DropdownMenuItem<String>>(
            (String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ),
          )
          .toList(),
      decoration: InputDecoration(
        labelText: label,
        border: InputBorder.none,
      ),
    );
  }
}
