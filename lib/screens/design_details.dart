import 'package:flutter/material.dart';
import 'package:ticka/core/colors.dart';
import 'package:ticka/core/fonts.dart';
import 'package:ticka/widgets/grid.dart';
import 'package:transparent_image/transparent_image.dart';

class DesignDetails extends StatefulWidget {
  const DesignDetails(
      {super.key,
      required this.image,
      required this.imageList,
      required this.index,
      required this.parent});
  final String parent;
  final int index;
  final String image;
  final List<String> imageList;
  @override
  State<DesignDetails> createState() => _DesignDetailsState();
}

class _DesignDetailsState extends State<DesignDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Hero(
                        tag: widget.parent == 'list'
                            ? 'image${widget.index}'
                            : 'grid${widget.index}',
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: widget.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 24,
                  child: Text(
                    'Designs of the week',
                    style: AppFonts.subtitle
                        .copyWith(color: AppColors.primaryColor, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    children: [
                      Grid(
                        imageList: widget.imageList,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'View All >>',
                            style: AppFonts.subtitle.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
