import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sampeapp/business_logic/misc/constants.dart';
import '../../business_logic/services/network_services.dart';
import '../../business_logic/models/video.dart';

class DeepDeenDashboardSwiperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DeepDeenVideo>>(
        future: ServerCommunications.getHomeBannerVideos(),
        builder: (BuildContext context,
            AsyncSnapshot<List<DeepDeenVideo>> snapshot) {

          if (snapshot.hasData) {
            List<DeepDeenVideo> videoList = snapshot.data;
            return Container(
              height: DeepDeenConstants.SWIPER_HEIGHT,
              child: Swiper(
                autoplayDelay: DeepDeenConstants.SWIPER_DELAY_MS,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.transparent],
                          ).createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height));
                        },
                        blendMode: BlendMode.dstIn,
                        child: Image.asset(
                            "assets/images/${videoList[index].thumbnail}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Text(
                          "${videoList[index].title}",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          "${videoList[index].subtitle}",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      )
                    ],
                  );
                },
                autoplay: true,
                itemCount: videoList.length,
                pagination: SwiperCustomPagination(
                    builder: (BuildContext context, SwiperPluginConfig config) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: DotSwiperPaginationBuilder(
                            color: Colors.grey,
                            activeColor: Colors.white,
                            size: 5.0,
                            activeSize: 8.0)
                        .build(context, config),
                  );
                }),
                control: new SwiperControl(
                    color: Colors.white, disableColor: Colors.grey),
              ),
            );
          }

          return Container(
            height: DeepDeenConstants.SWIPER_HEIGHT,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
