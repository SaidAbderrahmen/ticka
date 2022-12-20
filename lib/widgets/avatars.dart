import 'package:flutter/material.dart';
import 'package:ticka/core/colors.dart';
import 'package:ticka/core/fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class Avatars extends StatelessWidget {
  const Avatars({
    Key? key,
    required this.avatar,
    required this.banner,
    required this.avatarHeight,
    required this.avatarWidth,
    required this.avatarRadius,
    required this.bannerHeight,
    required this.bannerWidth,
    required this.bannerRadius,
    required this.spacing,
    required this.count,
    required this.username,
  }) : super(key: key);
  final String avatar;
  final String banner;
  final double avatarHeight;
  final double avatarWidth;
  final double avatarRadius;
  final double bannerHeight;
  final double bannerWidth;
  final double bannerRadius;
  final double spacing;
  final int count;
  final String username;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, left: 12),
                height: bannerHeight,
                width: bannerWidth,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius:
                        BorderRadius.all(Radius.circular(bannerRadius))),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(bannerRadius)),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: banner,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: avatarHeight,
                    width: avatarWidth,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius:
                            BorderRadius.all(Radius.circular(avatarRadius))),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(avatarRadius)),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: avatar,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Text(
                        username,
                        style: AppFonts.subtitle.copyWith(
                            color: AppColors.secondColor, fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
              height: spacing,
            ),
        itemCount: count);
  }
}
