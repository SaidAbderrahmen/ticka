import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    Key? key,
    required this.imageList,
    required this.height,
    required this.width,
    required this.spacing,
    required this.count,
    required this.axis,
    required this.radius,
  }) : super(key: key);

  final List<String> imageList;
  final double height;
  final double width;
  final double spacing;
  final int count;
  final Axis axis;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: axis,
        itemBuilder: (context, index) {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(radius))),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: imageList[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
              width: spacing,
            ),
        itemCount: count);
  }
}
