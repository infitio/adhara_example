import 'package:adhara/adhara.dart' show Bean;

class Vehicle extends Bean{

  static const String ID = "id";
  static const String NAME = "name";

  Vehicle(Map data): super(data);

  get id => data[ID];
  get name => data[NAME];

}