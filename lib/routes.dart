import 'package:flutter/material.dart';
import 'package:adhara/adhara.dart';
import 'package:adhara_example/urls.dart';

import 'package:adhara_example/screens/homepage.dart';
import 'package:adhara_example/screens/vehicles.dart';
import 'package:adhara_example/screens/vehicle_details.dart';

Route routeGenerator(RouteSettings routeSettings) {

  List<Map<String, dynamic>> urlPatterns = [
    {"pattern": URLS.VEHICLE, "router": VehicleDetails.router}
  ];

  Route route = getRoute(routeSettings, urlPatterns);

  if(route != null){
    return route;
  }

  ///ELSE, Instantiate a default page route, viz., HomePage and return...
  return MyCustomRoute(
    builder: {
//      URLS.login: (_) => LoginPage(),
      URLS.HOMEPAGE: (_) => HomePage(),
      URLS.VEHICLES: (_) => Vehicles()
    }[routeSettings.name] ?? (_) => HomePage(),
    settings: routeSettings,
  );
}