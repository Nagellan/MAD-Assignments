import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final Function(String) handleSubmit;
  final TextEditingController controller;

  SearchField({this.handleSubmit, this.controller});

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool isClearBtnVisible = false;

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    widget.controller.addListener(() {
      setState(() {
        isClearBtnVisible = widget.controller.text.length > 0;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the widget.controller when the widget is removed from the
    // widget tree.
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofocus: false,
      onSubmitted: (text) {
        widget.handleSubmit(text);
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15, 15, 0, 0),
        hintText: 'Search Pokemon',
        border: InputBorder.none,
        suffixIcon: Visibility(
          visible: isClearBtnVisible,
          child: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              widget.controller.clear();
            },
          ),
        ),
      ),
    );
  }
}
