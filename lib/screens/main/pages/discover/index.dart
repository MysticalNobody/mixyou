import 'package:flutter/material.dart';
import 'package:mexyou/screens/main/pages/discover/widgets/card.dart';
import 'package:swipe_stack/swipe_stack.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SwipeStack(
          visibleCount: 3,
          stackFrom: StackFrom.Bottom,
          translationInterval: 6,
          scaleInterval: 0.03,
          historyCount: 3,
          children: List.generate(3, (_) {
            return SwiperItem(builder: (SwiperPosition pos, progress) {
              return Opacity(
                opacity: _ == 2 ? 1 : _ == 2 ? 0.5 : 0.2,
                child: MYTinderCard(
                  images: [
                    'https://cdn.pixabay.com/photo/2015/02/02/11/09/office-620822_1280.jpg',
                    'https://cdn.pixabay.com/photo/2014/08/05/10/30/iphone-410324_1280.jpg',
                  ],
                ),
              );
            });
          }),
        ),
      ),
    );
  }
}
