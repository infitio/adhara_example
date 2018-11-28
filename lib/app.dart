import "package:adhara/adhara.dart";
import "package:flutter/material.dart";
import "package:adhara_example/routes.dart";


class App extends AdharaStatefulWidget{

  _AppState createState() => _AppState();

}

class _AppState extends AdharaState<App>{

  String get tag => "container";
  Widget home = Fetching();

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: r.getString("app_title"),
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
        primaryColor: const Color(0xff334454),
        indicatorColor: const Color(0xff273d52),
        primaryTextTheme: TextTheme(
          body2: const TextStyle(
            color:  const Color(0xE6273d52),
            fontWeight: FontWeight.w500,
            fontFamily: "SFProText",
            fontStyle:  FontStyle.normal,
            fontSize: 14.0
          ),
        ),
        cursorColor: const Color(0xff334454),
        textSelectionHandleColor: const Color(0xff48596b),
      ),
      home:  home,
      onGenerateRoute: routeGenerator,
    );
  }

}