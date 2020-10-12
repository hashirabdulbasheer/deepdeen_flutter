import 'package:flutter/material.dart';
import '../../business_logic/misc/colors.dart';

class DeepDeenMenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(child: Image.asset("assets/images/logo.png")),
            decoration: BoxDecoration(
              color: DeepDeenColors.DARK_BLUE,
            ),
          ),
          ListTile(
            title: _getRowTitle('Browse'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: _getRowTitle('Search'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: _getRowTitle('Settings'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: _getRowTitle('Help'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: _getRowTitle('Log out'),
            onTap: () {
              _logout(context);
            },
          )
        ],
      ),
    );
  }

  _getRowTitle(String title) {
    return Text(
      title,
      style: TextStyle(color: Colors.white),
    );
  }

  _logout(BuildContext context) {
    Navigator.of(context).popUntil(ModalRoute.withName("/"));
  }
}
