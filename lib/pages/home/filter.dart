import 'package:assignment_3/pages/home/select.dart';
import 'package:flutter/material.dart';

import '../../api_handler.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  final api = APIHandler();

  List<String> kinds = ['Any'];
  List<String> breeds = ['Any'];

  String currentKind = 'Any';
  String currentBreed = 'Any';

  void init() async {
    List<String> newKinds = await api.getKinds();
    setState(() {
      this.kinds = new List.from(['Any'])..addAll(newKinds);
    });
  }

  _FilterState() {
    print('FILTER INIT');
    init();
  }

  void handleChange({String kind, String breed}) {
    currentKind = kind == null ? currentKind : kind;
    currentBreed = breed == null ? currentBreed : breed;
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
                child: Select(
                  value: currentKind,
                  label: 'Kind',
                  items: kinds,
                  onChanged: (String value) async {
                    handleChange(kind: value);
                    List<String> newBreeds = await api.getBreeds(type: value);
                    setState(() {
                      this.currentBreed = 'Any';
                      this.breeds = new List.from(['Any'])..addAll(newBreeds);
                    });
                  },
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
                child: Select(
                  value: currentBreed,
                  label: 'Breed',
                  items: breeds,
                  onChanged: (String value) => handleChange(breed: value),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
