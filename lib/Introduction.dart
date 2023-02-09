// ignore_for_file:file_names

import 'package:demna/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class welcomescreen extends StatefulWidget {
  const welcomescreen({
    super.key,
  });

  @override
  State<welcomescreen> createState() => _welcomescreenState();
}

class _welcomescreenState extends State<welcomescreen> {
  bool firstOpen = true;

  _onIntroEnd(context) async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomePage()));
  }

  void getcred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      con = pref.getInt("con")!;
    });
  }

  _buildFullScreenImage() {
    return Container(
      margin: const EdgeInsets.all(22),
      child: Image.asset(
        'Images/background.jpg',
        fit: BoxFit.contain,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.topCenter,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getcred();
    Future.delayed(const Duration(seconds: 3), () {
      if (!firstOpen) {
        _onIntroEnd(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 19.0),
      // descriptionPadding: EdgeInsets.all(16),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return firstOpen
        ? IntroductionScreen(
            globalBackgroundColor: Colors.white,

            pages: [
              PageViewModel(
                title: "قال تعالى",
                body:
                    " {وَمَنْ أَحْيَاهَا فَكَأَنَّمَا أَحْيَا النَّاسَ جَمِيعاً}\n"
                    "صدق الله العظيم",
                decoration: pageDecoration.copyWith(
                  contentMargin: const EdgeInsets.symmetric(horizontal: 16),
                  fullScreen: true,
                  bodyFlex: 4,
                  imageFlex: 3,
                ),
              ),
              PageViewModel(
                title: '',
                body: 'التبرع بالدم واجب على كل إنسان تجاه أخيه المريض ',
                // image:,
                decoration: pageDecoration.copyWith(
                  contentMargin: const EdgeInsets.symmetric(horizontal: 16),
                  fullScreen: true,
                  bodyFlex: 4,
                  imageFlex: 3,
                ),
              ),
              PageViewModel(
                title: 'فوائد التبرع بالدم',
                body:
                    'يعمل على تنشيط نخاع العظام والذي هو مسئول عن تجديد مكونات الدم وبالتالي زيادة نشاط الدورة الدموية فيجعلك ذلك في صحة جيدة ونشاط دائم \n'
                    'ضبط نسبة الحديد في الدم وبالتالي حماية الجسم من مشاكل القلب\n'
                    'حماية الجسم من سرطان الدم',
                decoration: pageDecoration.copyWith(
                  contentMargin: const EdgeInsets.symmetric(horizontal: 16),
                  fullScreen: true,
                  bodyFlex: 10,
                  imageFlex: 3,
                ),
              ),
            ],
            onDone: () => _onIntroEnd(context),
            onSkip: () =>
                _onIntroEnd(context), // You can override onSkip callback
            showSkipButton: true,
            dotsFlex: 0,
            nextFlex: 0,
            skip: const Text(
              'Sauter',
              style: TextStyle(color: Colors.white),
            ),
            next: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            done: const Text('Done',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.white)),
            controlsMargin: const EdgeInsets.all(16),
            controlsPadding: const EdgeInsets.all(4),
            dotsDecorator: const DotsDecorator(
              size: Size(10.0, 10.0),
              color: Colors.white,
              activeSize: Size(22.0, 10.0),
              activeColor: Colors.amber,
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
            dotsContainerDecorator: const ShapeDecoration(
              color: Colors.black54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
          )
        : WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              body: SizedBox(
                height: size.height,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Image.asset(
                        'Images/6ab.png',
                        width: size.width * 0.3,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Image.asset(
                        'Images/6ab.png',
                        width: size.width * 0.2,
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'Images/6ab.png',
                        width: size.width * 0.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
