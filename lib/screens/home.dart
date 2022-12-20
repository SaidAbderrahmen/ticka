import 'package:flutter/material.dart';
import 'package:ticka/core/colors.dart';
import 'package:ticka/core/fonts.dart';
import 'package:ticka/widgets/avatars.dart';
import 'package:ticka/widgets/grid.dart';
import 'package:ticka/widgets/list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;

  List<String> imageList = [
    'https://ih0.redbubble.net/image.387076752.5202/flat,500x,075,f.jpg',
    'https://ih1.redbubble.net/image.401647094.7682/flat,500x,075,f.u3.jpg',
    'https://ih1.redbubble.net/image.895120549.3414/st,small,507x507-pad,600x600,f8f8f8.jpg',
    'https://ih0.redbubble.net/image.1224074260.2441/flat,500x,075,f.u6.jpg',
    'https://ih1.redbubble.net/image.259459882.6571/flat,500x,075,f.u10.jpg',
    'https://ih0.redbubble.net/image.4087870075.5468/flat,500x,075,f.u10.jpg',
    'https://ih1.redbubble.net/image.915340421.1538/flat,500x,075,f.u5.jpg',
    'https://ih1.redbubble.net/image.442203168.3624/st,small,507x507-pad,600x600,f8f8f8.jpg',
  ];
  List<String> topPicks = [
    'https://ih1.redbubble.net/image.3317936456.6746/flat,500x,075,f.u8.jpg',
    'https://ih1.redbubble.net/image.564397015.1202/flat,500x,075,f.u11.jpg',
    'https://ih1.redbubble.net/image.130848551.3477/flat,500x,075,f.u6.jpg',
    'https://ih1.redbubble.net/image.545762370.2751/flat,500x,075,f.u7.jpg',
    'https://ih1.redbubble.net/image.739657574.0516/flat,500x,075,f.u4.jpg',
    'https://ih1.redbubble.net/image.319271989.0556/flat,500x,075,f.u5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        title: Image.asset(
          "logo.png",
          width: 120,
          height: 20,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.search_rounded,
              color: AppColors.primaryColor,
            ),
          ),
        ],
        backgroundColor: AppColors.bgColor,
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "Explore The \n",
                  style: AppFonts.title.copyWith(
                    color: AppColors.primaryColor,
                  ),
                  children: [
                    TextSpan(
                      text: "             best Art Gallery\n",
                      style: AppFonts.title.copyWith(
                        color: AppColors.logoColor,
                      ),
                    ),
                    TextSpan(
                      text: "       In The World",
                      style: AppFonts.title.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
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
                      imageList: imageList,
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
              const SizedBox(
                height: 0,
              ),
              SizedBox(
                height: 24,
                child: Text(
                  'Top Selling Designs',
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
                    SizedBox(
                      height: 180,
                      child: CustomListView(
                          imageList: topPicks,
                          height: 180,
                          width: 120,
                          spacing: 15,
                          count: topPicks.length,
                          axis: Axis.horizontal,
                          radius: 25),
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
              SizedBox(
                height: 24,
                child: Text(
                  'Upcoming Artists',
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
                    Avatars(
                      username: "Abderrahmen Said\n1.2k Followers",
                      avatar:
                          'https://pub-static.fotor.com/assets/projects/pages/6bf412e2225d4906b3d699a3a0a4308b/300w/fotor-cf1c671a4f3e4134b3e67c5d00de68ce.jpg',
                      banner:
                          'https://us.123rf.com/450wm/vejaa/vejaa1802/vejaa180200088/95155044-dos-tonos-de-papel-rosa-y-rosa-bandera-de-fondo.jpg?ver=6',
                      avatarHeight: 60,
                      avatarWidth: 60,
                      avatarRadius: 50,
                      bannerHeight: 60,
                      bannerWidth: double.infinity,
                      bannerRadius: 15,
                      spacing: 15,
                      count: imageList.length - 5,
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
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(
          Icons.add,
          color: AppColors.bgColor,
        ),
      ),
    );
  }
}
