import 'dart:ui';
import 'package:flutter/material.dart';
import '../../views/utils/flip_card.dart';
import '../../business_logic/blocs/login_bloc.dart';
import '../../business_logic/services/network_services.dart';
import '../../business_logic/misc/colors.dart';
import '../../business_logic/misc/strings.dart';
import '../widgets/app_bar_widget.dart';

///
/// Login Screen with two modes for Email and Password entry
/// Successful login -> Move to Dashboard Screen
///
class DeepDeenLoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _DeepDeenLoginScreenState createState() => _DeepDeenLoginScreenState();
}

class _DeepDeenLoginScreenState extends State<DeepDeenLoginScreen> {
  DeepDeenLoginBloc _bloc = DeepDeenLoginBloc();
  TextEditingController _textEditingController = TextEditingController();
  GlobalKey<FlipCardState> _cardKey = GlobalKey<FlipCardState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: DeepDeenAppBarWidget(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 110,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.fitHeight, image: AssetImage("assets/images/home.jpg"))),
              child: Container(
                decoration: BoxDecoration(color: DeepDeenColors.DARK_BLUE.withOpacity(0.5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlipCard(
                      direction: FlipDirection.HORIZONTAL,
                      speed: 1000,
                      key: _cardKey,
                      flipOnTouch: false,
                      child: Stack(
                        children: <Widget>[
                          /// the Login Card
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 380,
                                child: Card(
                                  color: Colors.white,
                                  child: Column(
                                    children: <Widget>[
                                      /// App Name
                                      SizedBox(height: 30),
                                      Text(
                                        "${DeepDeenStrings.getString("app_name")}",
                                        style: TextStyle(color: Theme.of(context).accentColor, fontSize: 25),
                                      ),

                                      /// Sign in - Title
                                      SizedBox(height: 10),
                                      Text(
                                        "${DeepDeenStrings.getString("login_popup_title")}",
                                        style: TextStyle(color: Colors.black, fontSize: 18),
                                      ),

                                      /// Textfield entry
                                      SizedBox(height: 30),
                                      StreamBuilder<String>(
                                        stream: _bloc.textFieldStream,
                                        builder: (context, snapshot) => Padding(
                                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                          child: Container(
                                            height: 100,
                                            child: TextField(
                                              controller: _textEditingController,
                                              onChanged: _bloc.textFieldChanged,
                                              style: TextStyle(color: Colors.black, fontSize: 16),
                                              autofocus: true,
                                              maxLength: 100,
                                              obscureText: _bloc.isPasswordMode(),
                                              decoration: new InputDecoration(
                                                  border: new OutlineInputBorder(
                                                      borderSide: new BorderSide(color: Colors.black)),
                                                  hintText: _getTextFieldHint(),
                                                  hintStyle: TextStyle(color: Colors.grey),
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                  labelText: _getTextFieldLabel(),
                                                  prefixIcon: _getTextFieldIcon(),
                                                  errorText: snapshot.error,
                                                  prefixText: ' '),
                                            ),
                                          ),
                                        ),
                                      ),

                                      /// Login button
                                      StreamBuilder<bool>(
                                        stream: _bloc.submitStream,
                                        builder: (context, snapshot) => Padding(
                                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                          child: SizedBox(
                                            width: MediaQuery.of(context).size.width,
                                            height: 50,
                                            child: RaisedButton(
                                              color: Theme.of(context).accentColor,
                                              disabledColor: Theme.of(context).accentColor,
                                              disabledElevation: 0,
                                              elevation: 2,
                                              child: Text(
                                                _getSubmitButtonTitle(),
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              onPressed: snapshot.data == true ? _onSubmitTapped : null,
                                            ),
                                          ),
                                        ),
                                      ),

                                      /// Help button
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: FlatButton(
                                                onPressed: () {
                                                  _onHelpTapped();
                                                },
                                                child: Text("${DeepDeenStrings.getString("login_help_text")}",
                                                    style: TextStyle(
                                                        color: Theme.of(context).accentColor, fontSize: 15))),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          /// the Circular Progress Indicator
                          StreamBuilder<bool>(
                            stream: _bloc.loadingStream,
                            builder: (context, snapshot) {
                              if (snapshot.data == null || snapshot.data == false) return Container();
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                                  child: Container(
                                    color: Colors.white.withOpacity(0.8),
                                    height: 350,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      onFlip: () {
                        _bloc.showProgress();
                      },
                      onFlipDone: (result) {
                        _bloc.hideProgress();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /////////////////////////////////////////////////////////////////////
  ///  UI UTILS
  /////////////////////////////////////////////////////////////////////

  _getTextFieldHint() {
    if (_bloc.isPasswordMode()) {
      return "${DeepDeenStrings.getString("login_password_hint")}";
    }
    return "${DeepDeenStrings.getString("login_email_hint")}";
  }

  _getTextFieldLabel() {
    if (_bloc.isPasswordMode()) {
      return "${DeepDeenStrings.getString("login_password_label")}";
    }
    return "${DeepDeenStrings.getString("login_email_label")}";
  }

  _getTextFieldIcon() {
    if (_bloc.isPasswordMode()) {
      return const Icon(Icons.lock, color: Colors.orange);
    }
    return const Icon(Icons.email, color: Colors.orange);
  }

  _getSubmitButtonTitle() {
    if (_bloc.isPasswordMode()) {
      return "${DeepDeenStrings.getString("login_password_button_text")}";
    }
    return "${DeepDeenStrings.getString("login_email_button_text")}";
  }

  /////////////////////////////////////////////////////////////////////
  ///  ACTIONS
  /////////////////////////////////////////////////////////////////////

  /// If in email address mode ->  move to login screen(password mode)
  /// If in password mode -> validate and move to dashboard
  _onSubmitTapped() {
    // there is a valid entry from user
    if (_bloc.isPasswordMode()) {
      String email = _bloc.getEmail();
      String password = _bloc.getPassword();
      print("Email = $email, Password = $password");
      _bloc.showProgress();
      ServerCommunications.login(email, password).then((result) {
        // TODO: Check result status and show error if error
        _bloc.hideProgress();
        Navigator.pushNamed(context, "/dashboard");
      });
    } else {
      _bloc.nextMode();
      _textEditingController.text = "";
      _cardKey.currentState.toggleCard();
    }
    setState(() {});
  }

  _onHelpTapped() {}
}
