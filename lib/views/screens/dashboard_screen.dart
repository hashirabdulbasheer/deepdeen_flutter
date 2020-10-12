import 'package:flutter/material.dart';
import 'package:sampeapp/views/widgets/menu_drawer_widget.dart';
import '../../business_logic/services/network_services.dart';
import '../../views/widgets/dashboard_swiper_banner_widget.dart';
import '../../views/widgets/videos_row_widget.dart';
import '../../views/widgets/app_bar_widget.dart';

class DeepDeenDashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: DeepDeenAppBarWidget(),
      drawer: DeepDeenMenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DeepDeenDashboardSwiperWidget(),
            DeepDeenVideoRowWidget(
                title: "Continue Watching",
                videoFetcher: ServerCommunications.getRecentVideos()),
            Divider(color: Colors.grey),
            DeepDeenVideoRowWidget(
                title: "QnA",
                videoFetcher: ServerCommunications.getQnaVideos()),
            Divider(color: Colors.grey),
            DeepDeenVideoRowWidget(
                title: "Quran",
                videoFetcher: ServerCommunications.getQuranVideos()),
          ],
        ),
      ),
    );
  }
}
