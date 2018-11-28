import "package:adhara_example/app.dart";
import "package:adhara/adhara.dart";
import 'package:adhara_example/datainterfaces.dart';

class AppConfig extends Config{

  ///This is the starting point of rendering visible widgets
  get container => App();

  String get configFile{
    return isReleaseMode()
      ?"assets/config/production.json"
      :"assets/config/dev.json";
  }

  ///Custom network provider
  NetworkProvider get networkProvider => AppNetworkProvider(this);

  ///Custom data interface
  DataInterface get dataInterface => AppDataInterface(this);

  ///Map language files with language codes here. These files are to be mentioned in pubspec
  Map<String, String> get languageResources => {
    "en": "assets/languages/en.properties",
    "te": "assets/languages/te.properties",
    "de": "assets/languages/ka.properties",
  };

  ///Add any substring of the error message to be ignored from logging to sentry here
  List<String> get sentryIgnoreStrings => [
    "HTTP request failed, statusCode: 404", //All images that are not available throw a 404
    "Connection reset by peer",
    "Connection timed out",                 //Offline/bad network requests
  ];

  //  Add any custom configurations here. these configs are accessible via `r` (Resources) in all widgets and DataInterface

}
