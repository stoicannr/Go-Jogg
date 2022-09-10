import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MultipleDropdownList extends StatefulWidget {
  const MultipleDropdownList(
      {Key? key,
      this.customfunction1,
      this.customfunction2,
      this.chosenValue1,
      this.chosenValue2,
      this.chosenValue3,
      this.customfunction3})
      : super(key: key);

  final customfunction1;
  final customfunction2;
  final customfunction3;
  final chosenValue1;
  final chosenValue2;
  final chosenValue3;

  @override
  State<MultipleDropdownList> createState() => _MultipleDropdownListState();
}

class _MultipleDropdownListState extends State<MultipleDropdownList> {
  List<String> Locations1 = ["Cismigiu", "Herestrau", "Moghioros"];
  List<String> Locations2 = ["Cismigiu", "Herestrau", "Moghioros"];
  List<String> Locations3 = ["Cismigiu", "Herestrau", "Moghioros"];
  final disabledItems = [];
  String? chosenValue1 = "Cismigiu";
  String? chosenValue2 = "Cismigiu";
  String? chosenValue3 = "Cismigiu";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Select preffered locations"),
          Row(
            children: [
              DropdownButton<String>(
                value: chosenValue1.toString(),
                items: Locations1.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color:
                            disabledItems.contains(value) ? Colors.grey : null,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  if (!disabledItems.contains(value)) {
                    disabledItems.add(value);
                    setState(() {
                      chosenValue1 = value;
                      widget.customfunction1(chosenValue1);
                    });
                  }
                },
              ),
              DropdownButton<String>(
                value: chosenValue2.toString(),
                items: Locations2.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color:
                            disabledItems.contains(value) ? Colors.grey : null,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  if (!disabledItems.contains(value)) {
                    disabledItems.add(value);
                    setState(() {
                      chosenValue2 = value;
                      widget.customfunction2(chosenValue2);
                    });
                  }
                },
              ),
              DropdownButton<String>(
                value: chosenValue3.toString(),
                items: Locations3.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color:
                            disabledItems.contains(value) ? Colors.grey : null,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  if (!disabledItems.contains(value)) {
                    disabledItems.add(value);
                    setState(() {
                      chosenValue3 = value;
                      widget.customfunction3(chosenValue3);
                    });
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
