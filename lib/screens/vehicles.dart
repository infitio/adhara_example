import 'package:adhara/adhara.dart';
import 'package:flutter/material.dart';
import "package:adhara_example/datainterfaces.dart";


class Vehicles extends AdharaStatefulWidget{

  _VehiclesState createState() => _VehiclesState();

}

class _VehiclesState extends AdharaState<Vehicles>{

  ///Tag is used for adhara to identify a widget uniquely
  ///This is done as the reflection is not exposed as part of flutter-dart
  String get tag => "list-items";

  ///List of vehicle objects that are to be rendered...
  List<Vehicle> vehicles;

  ///This method is called for the very first time it renders after app is open.
  ///If this widget renders again 2nd time, this method will not be called.
  ///Adhara maintains these in its default [Scope] against the [tag] declared above
  @override
  firstLoad() async {
//    DO something when loading the widget for the very first time in app lifecycle
  }

  @override
  fetchData(Resources r) async {
    vehicles = await (r.dataInterface as AppDataInterface).getVehicles();
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container()
    );
  }

}