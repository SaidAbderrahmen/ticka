
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ticka/core/colors.dart';
import 'package:ticka/core/fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class Grid extends StatelessWidget {
  const Grid({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 10,
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: imageList[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10),
              child: Text("by Ticka merch",
                  style: AppFonts.subtitle
                      .copyWith(color: AppColors.primaryColor, fontSize: 12)),
            )
          ],
        );
      },
    );
  }
}
