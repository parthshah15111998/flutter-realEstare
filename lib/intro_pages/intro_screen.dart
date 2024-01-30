import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_e_state_project/intro_pages/intro_screen_model.dart';
import 'package:real_e_state_project/intro_pages/intro_screen_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<IntroScreenModel> imageText = [
    IntroScreenModel('assets/intro_screen_1.png', 'Find The Perfect Place',
        'Find the Ideal place according to your needs and Expectations'),
    IntroScreenModel('assets/intro_screen_2.png', 'Book a Place Easily',
        'Book a Real Estate Quickly and Easily with One Click'),
    IntroScreenModel(
        'assets/intro_screen_3.png',
        'Start Living in your Dream Home',
        'Start Searching and Quickly find the Home you were Looking for'),
  ];

  final pageController = PageController();
  late BuildContext context;
  late IntroScreenProvider IntroProvider;

  init(BuildContext ctx) {
    context = ctx;
    IntroProvider = Provider.of<IntroScreenProvider>(ctx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildPageView(),
          buildSmoothIndicator(),
        ],
      ),
      floatingActionButton: buildFloatingButton(),
    );
  }

  Widget buildFloatingButton() {
    return Container(
      padding: EdgeInsets.only(bottom: 13),
      child: FloatingActionButton(
        onPressed: () {
          pageController.nextPage(
              duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn);
        },
        backgroundColor: Color(0xff246BFD),
        elevation: 0.0,
        child: Icon(Icons.arrow_forward) ,
      ),
    );
  }

  Widget buildSmoothIndicator() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: 50),
          child: SmoothPageIndicator(
            controller: pageController,
            axisDirection: Axis.horizontal,
            count: imageText.length,
            effect: const WormEffect(
              dotHeight: 16,
              dotWidth: 16,
              dotColor: Color(0xffD2E0FF),
              activeDotColor: Color(0xff246BFD),
              // type: WormType.thinUnderground,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPageView() {
    return Consumer<IntroScreenProvider>(
      builder: (context, valueProvider, child) {
        return PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            valueProvider.number = value;
          },
          children: imageText
              .map((e) => buildImageText(e.image, e.title, e.description))
              .toList(),
        );
      },
    );
  }

  Widget buildImageText(String image, String title, String description) {
    return Column(
      children: [
        Image.asset(image),
        SizedBox(
          height: 30,
          width: 300,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
