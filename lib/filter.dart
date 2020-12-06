import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  List<String> kinds = ['Any', 'One', 'Two', 'Three', 'Four'];
  List<String> breeds = ['Any', 'One', 'Two', 'Three', 'Four'];

  String currentKind = 'Any';
  String currentBreed = 'Any';

  void handleChange({String kind, String breed}) {
    currentKind = kind == null ? currentKind : kind;
    currentBreed = breed == null ? currentBreed : breed;

    print('$currentKind $currentBreed');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: DropdownButtonFormField<String>(
                  value: currentKind,
                  onChanged: (String value) => handleChange(kind: value),
                  items: kinds
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  decoration: InputDecoration(
                    labelText: 'Kind',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                height: 40,
                child: VerticalDivider(
                  width: 30,
                ),
              ),
              Expanded(
                flex: 1,
                child: DropdownButtonFormField<String>(
                  value: currentBreed,
                  onChanged: (String value) => handleChange(breed: value),
                  items: breeds
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  decoration: InputDecoration(
                    labelText: 'Breed',
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
