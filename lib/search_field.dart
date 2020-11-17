import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _controller = TextEditingController();
  bool isClearBtnVisible = false;

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    _controller.addListener(() {
      setState(() {
        isClearBtnVisible = _controller.text.length > 0;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      autofocus: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15, 15, 0, 0),
        hintText: 'Search Pokemon',
        border: InputBorder.none,
        suffixIcon: Visibility(
          visible: isClearBtnVisible,
          child: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _controller.clear();
            },
          ),
        ),
      ),
    );
  }
}
