/*
import 'package:flutter/material.dart';
import 'package:adhara/adhara.dart';
import 'package:ideaspace/res/res.dart';
import 'package:ideaspace/constants.dart';
import 'package:ideaspace/datainterfaces.dart';
import 'package:ideaspace/widgets.dart';

class LoginPage extends AdharaStatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends AdharaState<LoginPage> {

  String get tag => "LoginPage";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User user = User();
  String buttonText = "login";
  String invalidCredentials = "";

  void submit(context) async {
    setState((){
      buttonText = "logging_in";
    });
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.
      try {
        User _user = await (r.dataInterface as AppDataInterface).login(user);
        trigger(Events.LOGGED_IN, _user); //Trigger captured in ideaspace_app.dart will update to splash screen again...
      }catch(response){
        buttonText = "login";
        invalidCredentials = {
          400: "invalid_credentials"
        }[response.statusCode] ??
          AppUtils.getErrorMessageFromResponse(context, response);
        setState((){});
Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(r.getString(invalidCredentials))
        ));

      }
    } else {
      setState((){ buttonText = "login"; invalidCredentials = ""; });
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: this._formKey,
          child: Builder(
            builder: (BuildContext context) {
              return _buildMainColumn(context);
            }
          )
        )
      ),
    );
  }

  _buildMainColumn(BuildContext context){

    final employeeId = TextFormField(
//      keyboardType: TextInputType.number,
      autofocus: false,
      decoration: InputDecoration(
        hintText: r.getString("login_key"),
        contentPadding: InfitioCustomStyles.inputContentPadding,
        border: InfitioCustomStyles.inputBorder,
      ),
      validator: (String value) {
        if (value.length == 0) {
          return r.getString("login_key_error");
        }
      },
      onSaved: (String value) {
        user.employeeId = value;
      }
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: r.getString("password"),
        contentPadding: InfitioCustomStyles.inputContentPadding,
        border: InfitioCustomStyles.inputBorder
      ),
      validator: (String value) {
        if (value.length < 1) {
          return r.getString("password_error");
        }
        return null;
      },
      onSaved: (String value) {
        user.password = value;
      }
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),
            child: FittedBox(
              child: Titles(
                size: MediaQuery.of(context).size.width*0.43,
              ),
              fit: BoxFit.scaleDown,
            ),
          )
        ),
        Container(
          margin: EdgeInsets.fromLTRB(36.0, 8.0, 36.0, 5.0),
          child: employeeId,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(36.0, 5.0, 36.0, 5.0),
          child: password,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(36.0, 5.0, 36.0, 60.0),
          child: Text(
            r.getString(invalidCredentials),
            style: TextStyle(color: InfitioColors.red),
          ),
        ),
        BottomButton( r.getString(buttonText),
          color: InfitioColors.dark_grey_blue_primary,
          onPressed: () => this.submit(context) )
      ]
    );
  }

}
*/
