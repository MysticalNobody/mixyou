import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mexyou/res/res.dart';
import 'package:shimmer/shimmer.dart';

/// Image widget with placeholder.
/// Wrap around CachedNetworkImage with Shimmer placeholder.
/// Display image from given [url]. Example: [ITImage('https://your_image.png')]
/// You can manually configure heigth of Image([heigth]), width od Image([width]) and circular border radius([borderRadius])
/// {@category Widgets}
class MYImage extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadius borderRadius;
  final String url;
  final BoxFit fit;
  const MYImage(this.url, {Key key, this.height, this.width, this.borderRadius, this.fit = BoxFit.cover})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        child: CachedNetworkImage(
          imageUrl: '$url',
          fit: fit,
          height: height,
          width: width,
          errorWidget: (context, str, obj) => Container(
            height: height,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: 4),
            alignment: Alignment.center,
            color: MYColors.bg,
            child: Text(
              "Не удалось загрузить изображение",
              style: captionWhiteTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          placeholder: (context, url) => Container(
            height: height,
            width: width,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(borderRadius: borderRadius ?? BorderRadius.circular(0)),
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey[100],
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                ),
              ),
            ),
          ),
        ));
  }
}
