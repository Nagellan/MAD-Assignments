import 'package:flutter/material.dart';

import 'file:///C:/Users/irekn/AndroidStudioProjects/MAD_Assignments/assignment_2/lib/pages/pokedex/search_field.dart';

class SearchBar extends StatefulWidget {
  final Function(String) handleSubmit;

  SearchBar({this.handleSubmit});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _controller = TextEditingController();
  bool isSearchBtnVisible = false;

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    _controller.addListener(() {
      setState(() {
        isSearchBtnVisible = _controller.text.length > 0;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the widget.controller when the widget is removed from the
    // widget tree.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11, vertical: 15),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: SearchField(
                      handleSubmit: widget.handleSubmit,
                      controller: _controller)),
              Expanded(
                  flex: 0,
                  child: Visibility(
                    visible: isSearchBtnVisible,
                    child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        if (_controller.text.isNotEmpty) {
                          widget.handleSubmit(_controller.text);
                        }
                      },
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
