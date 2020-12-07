import 'package:flutter/material.dart';

class Select extends StatelessWidget {
  final String value;
  final String label;
  final List<String> items;
  final void Function(String) onChanged;

  Select({this.value, this.label, this.items, this.onChanged}) {
    dynamic _items = items.toString();
    print('SELECT $_items');
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      value: value,
      onChanged: onChanged,
      items: items
              .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, overflow: TextOverflow.ellipsis),
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
