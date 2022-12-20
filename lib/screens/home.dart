import 'package:flutter/material.dart';
import 'package:ticka/core/colors.dart';
import 'package:ticka/core/fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  bool kTabActive = false;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> imageList = [
    'https://images.unsplash.com/photo-1634986666676-ec8fd927c23d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZGlnaXRhbCUyMGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b60d32cd-b4e4-470b-9ebf-fbdea1db002a/dnna73-9a0fe0a1-7703-47c8-b2a2-42e08bcd591b.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2I2MGQzMmNkLWI0ZTQtNDcwYi05ZWJmLWZiZGVhMWRiMDAyYVwvZG5uYTczLTlhMGZlMGExLTc3MDMtNDdjOC1iMmEyLTQyZTA4YmNkNTkxYi5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.R8ZHSOfeIBo9IFhfqwZH9sRwDsxTXI114w95B49T2Ao',
    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/15271cea-0e82-44e1-8f10-8aa0933bbb55/delv8ge-35da501f-e9af-4107-b846-56258bebc9f4.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzE1MjcxY2VhLTBlODItNDRlMS04ZjEwLThhYTA5MzNiYmI1NVwvZGVsdjhnZS0zNWRhNTAxZi1lOWFmLTQxMDctYjg0Ni01NjI1OGJlYmM5ZjQuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.iC0I06IsiGk2PSSk6A8ESfydieMUP6wMTk5o0HPQW10',
    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/91dda5fd-93d0-4124-abe4-50bdf8e54899/deh71bu-a733731a-e3e8-4d7d-a148-90b45e0720b9.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzkxZGRhNWZkLTkzZDAtNDEyNC1hYmU0LTUwYmRmOGU1NDg5OVwvZGVoNzFidS1hNzMzNzMxYS1lM2U4LTRkN2QtYTE0OC05MGI0NWUwNzIwYjkuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.dVARwD6P7GyopC7KUP7lU718G9L5d0mMQYNiB2OCgmI',
    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3f4c7736-1faf-47af-b8f7-1199100eb335/d2q5fwv-fe89c41b-39a3-44ea-bb00-fbb3deb9aa9c.jpg/v1/fill/w_266,h_350,q_70,strp/kaka_by_crisvector_d2q5fwv-350t.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzNmNGM3NzM2LTFmYWYtNDdhZi1iOGY3LTExOTkxMDBlYjMzNVwvZDJxNWZ3di1mZTg5YzQxYi0zOWEzLTQ0ZWEtYmIwMC1mYmIzZGViOWFhOWMuanBnIiwiaGVpZ2h0IjoiPD03OTAiLCJ3aWR0aCI6Ijw9NjAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLndhdGVybWFyayJdLCJ3bWsiOnsicGF0aCI6Ilwvd21cLzNmNGM3NzM2LTFmYWYtNDdhZi1iOGY3LTExOTkxMDBlYjMzNVwvY3Jpc3ZlY3Rvci00LnBuZyIsIm9wYWNpdHkiOjk1LCJwcm9wb3J0aW9ucyI6MC40NSwiZ3Jhdml0eSI6ImNlbnRlciJ9fQ.OcWWSG1MCNSRBFiTGB5UXKn55lZTOyjjR-QFmLWPI04',
    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/9e66f4c5-b026-44bb-80ad-08a85c19d385/dblqk74-7805df4d-a4d9-469a-acbc-126e08f01b6e.jpg/v1/fill/w_1024,h_1024,q_75,strp/guitar_girl_by_camille_marie_dblqk74-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTAyNCIsInBhdGgiOiJcL2ZcLzllNjZmNGM1LWIwMjYtNDRiYi04MGFkLTA4YTg1YzE5ZDM4NVwvZGJscWs3NC03ODA1ZGY0ZC1hNGQ5LTQ2OWEtYWNiYy0xMjZlMDhmMDFiNmUuanBnIiwid2lkdGgiOiI8PTEwMjQifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.A2-MQu53aHcMYRBaTI6Nj5JHXQCWT9kHZ2XSmw7xi3k',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
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
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 90,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 24,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            currentTab = index;
                          });
                        },
                        child: Text(
                          'Painting $index',
                          style: AppFonts.subtitle.copyWith(
                            color: currentTab == index
                                ? AppColors.primaryColor
                                : AppColors.thirdColor,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 15,
                        ),
                    itemCount: imageList.length),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 160,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 180,
                        width: 110,
                        decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: imageList[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 30,
                        ),
                    itemCount: imageList.length),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Popular Art",
                  style: AppFonts.subtitle.copyWith(
                    color: AppColors.primaryColor,
                  )),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 80,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 80,
                        width: 90,
                        decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: imageList.reversed.toList()[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 15,
                        ),
                    itemCount: imageList.length),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Popular Artists",
                  style: AppFonts.subtitle.copyWith(
                    color: AppColors.primaryColor,
                  )),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                right: 20, top: 10, left: 10),
                            height: 80,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Colors.transparent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image:
                                    'https://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/24cf8be1297fd32.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            width: 70,
                            decoration: const BoxDecoration(
                                color: Colors.transparent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image:
                                    "https://cdn.dribbble.com/users/3200733/screenshots/14467409/media/786de15b582636c43de3a9c5fe4a87b2.png?compress=1&resize=1000x750&vertical=top",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 15,
                        ),
                    itemCount: 6),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'liked',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
