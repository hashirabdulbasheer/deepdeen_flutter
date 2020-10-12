import 'package:flutter/material.dart';
import 'package:sampeapp/business_logic/misc/strings.dart';
import 'package:sampeapp/views/screens/dashboard_screen.dart';
import 'package:sampeapp/views/screens/login_screen.dart';
import 'package:sampeapp/views/screens/video_player_screen.dart';
import 'views/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: DeepDeenStrings.getString("app_name"),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Color.fromARGB(0xFF, 0xE8, 0x58, 0x32),
        scaffoldBackgroundColor: Colors.black,
        dividerColor: Colors.grey,
        canvasColor: Colors.black,
//        fontFamily: 'Georgia',
        textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.white),
            subtitle1: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),
            button: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
            bodyText2: TextStyle(fontSize: 14.0, color: Colors.white),
            bodyText1: TextStyle(fontSize: 14.0, color: Colors.grey),
            caption: TextStyle(fontSize: 16.0, color: Colors.white, height: 1.5)),
      ),
      initialRoute: DeepDeenHomeScreen.routeName,
      routes: {
        DeepDeenHomeScreen.routeName: (context) => DeepDeenHomeScreen(),
        DeepDeenDashboardScreen.routeName: (context) => DeepDeenDashboardScreen(),
        DeepDeenVideoPlayerScreen.routeName: (context) => DeepDeenVideoPlayerScreen(),
        DeepDeenLoginScreen.routeName: (context) => DeepDeenLoginScreen(),
      },
    );
  }
}
