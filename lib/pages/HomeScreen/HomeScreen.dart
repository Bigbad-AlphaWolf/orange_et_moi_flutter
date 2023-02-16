import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orange_et_moi/model/slide.dart';
import 'package:orange_et_moi/pages/LoginScreen/LoginScreen.dart';
import 'package:orange_et_moi/pages/utils/index.dart';
import 'package:orange_et_moi/services/secure_storage/secure_storage.service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static final List<Slide> home_slides = [
    Slide(
        imagePath: "assets/images/home_slides/new-boarding-1.png",
        title: "Dalal ak Jam ci Orange et moi",
        description:
            "L’application pour gérer vos offres internet et mobile facilement depuis votre mobile."),
    Slide(
        imagePath: "assets/images/home_slides/new-boarding-2.png",
        title: "Suivre ma consommation",
        description:
            "Consultez vos soldes en temps réel (Crédit, internet, Orange Money et Sargal)"),
    Slide(
        imagePath: "assets/images/home_slides/new-boarding-3.png",
        title: "Acheter du crédit  et des pass",
        description:
            "Retrouvez vos pass internet et illimix préférés et profitez des promos"),
    Slide(
        imagePath: "assets/images/home_slides/new-boarding-4.png",
        title: "Transférer de l’argent",
        description:
            "Effectuez toutes vos opérations de transferts d’argent sans vous déplacer"),
    Slide(
        imagePath: "assets/images/home_slides/new-boarding-3.png",
        title: "Payer vos factures",
        description:
            "Consultez et payer toutes vos factures en un seul lieu et en toute sécurité"),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    generateUUID();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
          // appBar: AppBar(
          //   systemOverlayStyle: SystemUiOverlayStyle(
          //     // Status bar brightness (optional)
          //     statusBarIconBrightness:
          //         Brightness.dark, // For Android (dark icons)
          //     statusBarBrightness: Brightness.light, // For iOS (dark icons)
          //   ),
          // ),
          body: SafeArea(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    CarouselSlider.builder(
                        itemCount: HomeScreen.home_slides.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                // margin: EdgeInsets.symmetric(horizontal: 5.0),
                                // decoration: BoxDecoration(color: Colors.amber),
                                child: Column(
                                  children: [
                                    Image(
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        image: AssetImage(HomeScreen.home_slides
                                            .elementAt(itemIndex)
                                            .imagePath)),
                                    Container(
                                      padding:
                                          EdgeInsets.only(top: 40, bottom: 10),
                                      child: Text(
                                          HomeScreen.home_slides
                                              .elementAt(itemIndex)
                                              .title,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'HelveticaNeueLTStd-Bd',
                                            fontSize: 24.0,
                                          )),
                                    ),
                                    Expanded(
                                      child: Text(
                                        HomeScreen.home_slides
                                            .elementAt(itemIndex)
                                            .description,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily:
                                                'HelveticaNeueLTStd-Roman',
                                            fontSize: 16.0),
                                      ),
                                    ),
                                  ],
                                )),
                        options: CarouselOptions(
                            // height: MediaQuery.of(context).size.height - 50,
                            aspectRatio: 1,
                            autoPlay: true,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            })),
                    Positioned(
                      bottom: 150,
                      child: AnimatedSmoothIndicator(
                        activeIndex: _currentIndex,
                        count: HomeScreen.home_slides.length,
                        effect: WormEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          dotColor: Color.fromARGB(255, 204, 204, 204),
                          activeDotColor: Color.fromARGB(255, 255, 121, 0),
                          type: WormType.normal,
                          // strokeWidth: 5,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      fixedSize: Size.fromWidth(200),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 14),
                      backgroundColor: Color.fromARGB(255, 255, 121, 0),
                      foregroundColor: Colors.white),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: const Text(
                    'Je me connecte',
                    style: TextStyle(
                        fontFamily: 'HelveticaNeueLTStd-Bd', fontSize: 16),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  Future generateUUID() async {
    final String? storedUUID =
        await SecureStorage().getValue(StorageKeys.UUID.name);
    print("uuid  $storedUUID");
    if (storedUUID == null) {
      var uuid = Uuid();
      await SecureStorage().save(StorageKeys.UUID.name, uuid.v1());
    }
  }
}
