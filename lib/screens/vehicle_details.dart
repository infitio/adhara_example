import "package:adhara/adhara.dart";
import "package:flutter/material.dart";
import "package:adhara_example/datainterfaces.dart";


class VehicleDetails extends AdharaStatefulWidget{

  final int vehicleId;
  VehicleDetails(this.vehicleId);

  _VehicleDetailsState createState() => _VehicleDetailsState();

  static router({String vehicleId}){
    return VehicleDetails(int.parse(vehicleId));
  }

}

class _VehicleDetailsState extends AdharaState<VehicleDetails>{

  String get tag => "vehicle-details";
  Vehicle vehicle;

  @override
  fetchData(Resources r) async {
    vehicle = await (r.dataInterface as AppDataInterface).getVehicle(widget.vehicleId);
    setState((){});
  }

  Widget build(BuildContext context){
    return Container();
  }

}