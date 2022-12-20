import 'package:flutter/material.dart';
import 'package:ticka/core/colors.dart';
import 'package:ticka/core/fonts.dart';
import 'package:ticka/main.dart';
import 'package:transparent_image/transparent_image.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late PageController _pageController;
  int currentPage = 0;

  Future setSeenonboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
    // this will set seenOnboard to true when running onboard page for first time.
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    //setSeenonboard(); ba3d debug taw nraja3ha
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const OnBoarding(
                    description:
                        'Browse unlimited designs\nfrom the best designers in Tunisia',
                    title: 'Get your favourite goodie\nwith Ticka World',
                    image:
                        'https://img.freepik.com/free-vector/programmer-graphic-designer-characters-create-website-man-with-laptop-woman-with-tablet-deve_107791-7443.jpg?w=740&t=st=1671446298~exp=1671446898~hmac=637b4b130fe3a410b747f0f8840a129c7a3b41653e2d6119196df1593adae205',
                  );
                },
                onPageChanged: (value) => setState(() {
                  currentPage = value;
                }),
              ),
            ),
            currentPage == 3
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: SizedBox(
                      height: 50,
                      width: 230,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Home(),
                              ));
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                        ),
                        child: Text(
                          "Get Started",
                          style: AppFonts.title.copyWith(
                              color: AppColors.secondColor, fontSize: 20),
                        ),
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OnBoardNavBtn(
                        name: 'Skip',
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()));
                        },
                      ),
                      Row(
                        children: List.generate(
                          4,
                          (index) {
                            return AnimatedContainer(
                              margin: const EdgeInsets.only(right: 5),
                              duration: const Duration(milliseconds: 400),
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                color: currentPage == index
                                    ? AppColors.bgColor
                                    : AppColors.primaryColor,
                                shape: BoxShape.circle,
                              ),
                            );
                          },
                        ),
                      ),
                      OnBoardNavBtn(
                        name: 'Next',
                        onPressed: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.ease,
                          );
                        },
                      )
                    ],
                  )
          ],
        ),
      ),
    );
  }
}

class OnBoarding extends StatelessWidget {
  const OnBoarding({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);
  final String title;
  final String description;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: image,
          fit: BoxFit.cover,
        ),
        const Spacer(),
        Text(
          title,
          style: AppFonts.title,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          description,
          style: AppFonts.subtitle,
          textAlign: TextAlign.center,
        ),
        const Spacer()
      ],
    );
  }
}

class OnBoardNavBtn extends StatelessWidget {
  const OnBoardNavBtn({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);
  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(6),
      splashColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          name,
          style: AppFonts.subtitle,
        ),
      ),
    );
  }
}
