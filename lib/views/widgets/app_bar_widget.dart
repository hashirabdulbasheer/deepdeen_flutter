import 'package:flutter/material.dart';
import '../../business_logic/misc/constants.dart';

//////////////////////////////////////////////////////
///
/// Appbar
///
//////////////////////////////////////////////////////
class DeepDeenAppBarWidget extends StatelessWidget implements PreferredSizeWidget {

  const DeepDeenAppBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.blue,
        flexibleSpace: Stack(
          children: <Widget>[
            Image(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              image: const AssetImage('assets/images/navbackground.png'),
              fit: BoxFit.cover,
            ),
            Center(
              child: SizedBox(
                width: 50,
                child: Image(
                  image: const AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ));
  }

  @override
  Size get preferredSize =>
      new Size.fromHeight(DeepDeenConstants.APPBAR_HEIGHT);
}
