import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:starter_flutter/models/user_model.dart' as UserModel;

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen(
      {Key? key, required this.uid, required this.appUsers, required this.name})
      : super(key: key);

  final String uid;
  final List<UserModel.User> appUsers;
  final String name;

  @override
  State<GoogleMapScreen> createState() => GoogleMapScreenState();
}

class GoogleMapScreenState extends State<GoogleMapScreen> {
  String? docId;
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('usersData');

  late final String name;
  late final List<UserModel.User> appUsers;

  @override
  void initState() {
    super.initState();
    appUsers = widget.appUsers;
    name = widget.name;
    _getLabelMarkers();
    getData();
  }

  Future getData() async {
    // Get docs from collection reference
    var querySnapshot =
        await _collectionReference.get().then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((element) {
                if (element.data()!.toString().contains(widget.uid)) {
                  docId = element.id;
                }
              })
            });
  }

  late GoogleMapController _controller;
  late Marker myMarker;
  late Set<Marker> mapMarkers;

  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(45.43296265331129, 25.08832357078792),
    zoom: 2.4746,
  );

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: GoogleMap(
        mapToolbarEnabled: false,
        myLocationButtonEnabled: false,
        markers: mapMarkers,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final position = await _getCurrentPosition();
          _controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 14),
          ));
        },
        label: const Text('Update location'),
        icon: const Icon(Icons.run_circle_outlined),
      ),
    );
  }

  Set<Marker> _getLabelMarkers() {
    final markers = <Marker>{};

    for (final user in appUsers) {
      markers.add(Marker(
          icon: (user.name != widget.name)
              ? BitmapDescriptor.defaultMarkerWithHue(260)
              : BitmapDescriptor.defaultMarkerWithHue(0),
          markerId: MarkerId(user.name),
          infoWindow: InfoWindow(
              title: (user.name != widget.name) ? user.name : 'My Location'),
          position: LatLng(double.parse(user.lat), double.parse(user.long))));
    }

    setState(() {
      mapMarkers = markers;
    });

    return markers;
  }

  Future<Position> _getCurrentPosition() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      return Future.error('Location services are disabled.');
    }
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    final position = await Geolocator.getCurrentPosition();
    final _collectionReference = FirebaseFirestore.instance;
    _collectionReference.collection("usersData").doc(docId).update({
      'lat': (position.latitude).toString(),
      'long': position.longitude.toString()
    });
    var marks = mapMarkers.toList();
    var markz =
        marks.firstWhere((element) => element.markerId.value == widget.name);
    marks
      ..remove(markz)
      ..add(Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(0),
          markerId: MarkerId(widget.name),
          infoWindow: InfoWindow(title: widget.name),
          position: LatLng(position.latitude, position.longitude)));
    var mf = marks.toSet();
    setState(() {
      mapMarkers = mf;
    });
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return position;
  }
}
