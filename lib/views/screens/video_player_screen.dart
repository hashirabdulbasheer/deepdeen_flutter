import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../views/widgets/app_bar_widget.dart';

class DeepDeenVideoPlayerScreen extends StatefulWidget {
  static const routeName = '/player';

  @override
  _DeepDeenVideoPlayerScreenState createState() => _DeepDeenVideoPlayerScreenState();
}

class _DeepDeenVideoPlayerScreenState extends State<DeepDeenVideoPlayerScreen> {
  bool _isLoading = false;
  String _videoUrl = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: DeepDeenAppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  _getVideoPlayer(),
                  if (_isLoading)
                    Container(height: 300, child: Center(child: CircularProgressIndicator()))
                  else
                    Container(height: 300)
                ],
              ),
            ),
            _getVideoDescription(),
            _getRelatedVideos()
          ],
        ),
      ),
    );
  }

  _getRelatedVideos() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(
            color: Colors.grey,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "UP NEXT IN SURAH AL-MULK",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          SizedBox(height: 20),
          Image.asset("assets/images/surahmulk.png"),
          SizedBox(height: 10),
          Text("Surah Mulk-Part4", style: TextStyle(color: Colors.white, fontSize: 16))
        ],
      ),
    );
  }

  _getVideoDescription() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Tafsir of Juz Tabarak",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          SizedBox(height: 10),
          Text(
            "Surah Mulk-Part3",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "45m",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  _getVideoPlayer() {
    return Stack(
      children: <Widget>[
        SizedBox(
          height: 300,
          child: Hero(
            tag: "Continue Watching_video0",
            child: InAppWebView(
              initialUrl: _videoUrl,
              initialHeaders: {},
              initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                debuggingEnabled: true,
              )),
              onWebViewCreated: (InAppWebViewController controller) {
                setState(() {
                  _isLoading = true;
                });
              },
              onLoadStart: (InAppWebViewController controller, String url) {},
              onLoadStop: (InAppWebViewController controller, String url) async {
                setState(() {
                  _isLoading = false;
                });
              },
              onEnterFullscreen: (InAppWebViewController controller) {
                SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
              },
              onExitFullscreen: (InAppWebViewController controller) {
                SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
              },
              onProgressChanged: (InAppWebViewController controller, int progress) {},
            ),
          ),
        ),
        if (_isLoading) Container(height: 300, color: Colors.black)
      ],
    );
  }
}
