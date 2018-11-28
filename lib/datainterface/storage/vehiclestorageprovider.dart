import 'package:adhara/adhara.dart';
import 'package:adhara_example/datainterface/bean/Vehicle.dart';

class VehicleStorageProvider extends BeanStorageProvider{

  static const String TABLE_NAME = "vehicles";

  VehicleStorageProvider(Config config) : super(config);

  get tableName => TABLE_NAME;

  List<StorageClass> get fields{
    return [
      IntegerColumn(Vehicle.ID),
      TextColumn(Vehicle.NAME)
    ];
  }

}