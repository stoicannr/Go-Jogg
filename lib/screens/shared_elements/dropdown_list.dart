import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownList extends StatefulWidget {
  final String option1, option2;
  final String option3;
  final String title;
  final customFunction;
  final String? oldData;
  final String? sex;

  const DropdownList({
    Key? key,
    this.option1 = 'none',
    this.option2 = 'none',
    this.option3 = '',
    required this.title,
    this.customFunction,
    this.oldData,
    this.sex,
  }) : super(key: key);

  @override
  _DropdownListState createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  var _dropDownValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dropDownValue = widget.sex;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        DropdownButton(
          value: _dropDownValue,
          hint: widget.oldData == null
              ? Text('Select')
              : Text(
                  widget.oldData.toString(),
                  style: TextStyle(color: Colors.blue),
                ),
          isExpanded: true,
          iconSize: 30.0,
          style: TextStyle(color: Colors.blue),
          items: [widget.option1, widget.option2, widget.option3].map(
            (val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(val),
              );
            },
          ).toList(),
          onChanged: (val) {
            setState(
              () {
                _dropDownValue = val.toString();
                widget.customFunction(_dropDownValue);
              },
            );
          },
        ),
      ],
    );
  }
}
