import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  final String value;
  final String label;
  final List<String> items;
  final void Function(String) onChanged;

  Select({this.value, this.label, this.items, this.onChanged}) {}

  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      value: widget.value,
      onChanged: widget.onChanged,
      items: widget.items
          .map<DropdownMenuItem<String>>(
            (String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value, overflow: TextOverflow.ellipsis),
            ),
          )
          .toList(),
      decoration: InputDecoration(
        labelText: widget.label,
        border: InputBorder.none,
      ),
    );
  }
}
