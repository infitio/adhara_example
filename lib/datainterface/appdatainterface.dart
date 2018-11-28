import 'package:adhara/adhara.dart';
import 'package:adhara_example/datainterfaces.dart';

class AppDataInterface extends DataInterface{

  VehicleStorageProvider _vehicleStorageProvider;

  AppDataInterface(Config config):
      _vehicleStorageProvider = VehicleStorageProvider(config),
      super(config);

  ///Return all data stores to initialize whenever application starts.
  ///Creates tables only if they exist.
  List<StorageProvider> get dataStores => [
    _vehicleStorageProvider
  ];

  Future fetchVehicles() async {
    List<Map> _vehicles = await networkProvider.get('vehicles_list.json');
    await _vehicleStorageProvider.delete(); //clear all old rows, or clear as required using parameters...
    saveAll(_vehicleStorageProvider, _vehicles.map((Map _) => Vehicle(_)).toList());
  }

  Future createVehicle(Vehicle vehicle) async {
    Map _vehicle = await networkProvider.post('new_vehicle.json', vehicle.toNetworkSerializableMap());
    Vehicle newVehicle = Vehicle(_vehicle); //Dumping old vehicle as we are expecting new data from server like vehicle ID
    await save(_vehicleStorageProvider, newVehicle);
    return newVehicle;
  }

  Future<List<Vehicle>> getVehicles() async {
    List<Map> _vehicles = await query(_vehicleStorageProvider);
    return _vehicles.map((Map _) => Vehicle(_)).toList();
  }

  Future<Vehicle> getVehicle(int vehicleId) async {
    List<Map> _vehicles = await query(_vehicleStorageProvider, where: "${Vehicle.ID}=?", whereArgs: [vehicleId]);
    if(_vehicles.length>0){
      return Vehicle(_vehicles[0]);
    }
    return null;
  }

}