import 'package:flutter/material.dart';
import 'package:starter_flutter/screens/shared_elements/person_card2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindScreen extends StatefulWidget {
  final List<PersonCard2> personCards;
  final int length;
  const FindScreen({Key? key, required this.personCards, required this.length})
      : super(key: key);
  @override
  _FindScreenState createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      _sort = widget.personCards;
    });
  }

  List<PersonCard2> personCards = [];
  String? _dropdownValue;
  List<PersonCard2> _sort = [];
  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  void sortItems(String? value) {
    switch (value) {
      case 'Name':
        _sort.sort(
            (first, second) => first.namePerson.compareTo(second.namePerson));
        break;
      case "Age":
        _sort.sort((a, b) {
          var age1 = int.parse(a.age);
          var age2 = int.parse(b.age);
          if (age1 > age2)
            return -1;
          else if (age1 < age2)
            return 1;
          else {
            return 0;
          }
        });
        break;
      case "Location":
        _sort.sort(
            (first, second) => first.location1.compareTo(second.location1));
        break;
      case "Distance":
        _sort.sort((a, b) {
          final dist1 = int.parse(a.distance);
          final dist2 = int.parse(b.distance);
          if (dist1 > dist2)
            return -1;
          else if (dist1 < dist2)
            return 1;
          else
            return 0;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    personCards = widget.personCards;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 44.h,
          ),
          Align(
              alignment: Alignment.center,
              child: Text('Find joggers',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.sp,
                  ))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Sort by "),
              DropdownButton(
                  icon: Icon(Icons.sort),
                  items: const [
                    DropdownMenuItem(child: Text("Name"), value: "Name"),
                    DropdownMenuItem(
                      child: Text("Location"),
                      value: "Location",
                    ),
                    DropdownMenuItem(
                      child: Text("Age"),
                      value: "Age",
                    ),
                    DropdownMenuItem(
                      child: Text("Distance"),
                      value: "Distance",
                    )
                  ],
                  value: _dropdownValue,
                  onChanged: (String? _dropdownValue) {
                    dropdownCallback;
                    setState(() {
                      sortItems(_dropdownValue);
                    });
                  })
            ],
          ),
          ...List.generate(
              personCards.length,
              (index) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(child: _sort[index]),
                    ],
                  ))
        ],
      ),
    ));
  }
}
