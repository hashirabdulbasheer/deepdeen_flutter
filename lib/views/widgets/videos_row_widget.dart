import 'package:flutter/material.dart';
import '../../business_logic/misc/constants.dart';
import '../../business_logic/models/video.dart';

class DeepDeenVideoRowWidget extends StatelessWidget {
  final String title;
  final Future<List<DeepDeenVideo>> videoFetcher;

  const DeepDeenVideoRowWidget({Key key, this.title, this.videoFetcher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DeepDeenVideo>>(
        future: videoFetcher,
        builder: (BuildContext context, AsyncSnapshot<List<DeepDeenVideo>> snapshot) {
          if (snapshot.hasData) {
            List<DeepDeenVideo> videoList = snapshot.data;
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text("$title", style: Theme.of(context).textTheme.subtitle1)),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: DeepDeenConstants.VIDEO_ROW_HEIGHT,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: videoList.length,
                              separatorBuilder: (context, index) {
                                return SizedBox(child: Divider(), width: 15);
                              },
                              itemBuilder: (context, index) {
                                return InkWell(
                                  hoverColor: Colors.black,
                                  onTap: () {
                                    Navigator.pushNamed(context, '/player');
                                  },
                                  child: Container(
                                    height: 200,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Hero(
                                          tag: "${title}_video$index",
                                          child: Image.asset("assets/images/${videoList[index].thumbnail}",
                                              height: 120),
                                        ),
                                        SizedBox(height: 10),
                                        Text("${videoList[index].title}",
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context).textTheme.bodyText1)
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }
          return Container(
            height: DeepDeenConstants.VIDEO_ROW_HEIGHT,
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
