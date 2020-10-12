import 'package:flutter/material.dart';
import '../../business_logic/misc/strings.dart';
import '../../views/widgets/app_bar_widget.dart';

//////////////////////////////////////////////////////
///
/// This is first screen that appears if user has
/// not logged in.
///
//////////////////////////////////////////////////////
class DeepDeenHomeScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: DeepDeenAppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Theme.of(context).primaryColor, Colors.transparent],
                      ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Container(
                      height: MediaQuery.of(context).size.height - 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: new BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: new ColorFilter.mode(
                                Theme.of(context).primaryColor.withOpacity(0.7), BlendMode.dstATop),
                            image: AssetImage("assets/images/home.jpg")),
                      ),
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50),
                    Image.asset("assets/images/logobig.png"),
                    SizedBox(height: 100),
                    Container(
                      height: 60,
                      width: 250,
                      child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        child: Text(
                          DeepDeenStrings.getString("start_free_trial"),
                          style: Theme.of(context).textTheme.button,
                        ),
                        onPressed: () => _signUpPressed(context),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(" ${DeepDeenStrings.getString("or")} ",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 250,
                      height: 60,
                      child: FlatButton(
                          highlightColor: Colors.orange.withOpacity(0.5),
                          child: Text(DeepDeenStrings.getString("sign_in"),
                              style: Theme.of(context).textTheme.button),
                          onPressed: () => _signInPressed(context)),
                    )
                  ],
                )
              ],
            ),

            ////////////////////////////////////////////////////////////////
            // Home Screen Message
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Container(
                child: Text(
                  DeepDeenStrings.getString("home_screen_message"),
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            //////////////////////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }

  ////////////////////////////////////////////////////////////////
  // ACTIONS
  _signUpPressed(BuildContext context) {}

  _signInPressed(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }
//////////////////////////////////////////////////////////////////

}
