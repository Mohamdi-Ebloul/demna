// ignore_for_file:file_names

import 'package:demna/HomePage.dart';
import 'package:flutter/material.dart';
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
  _onIntroEnd(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool("firstOpen", false);

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }

  void getcred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      con = pref.getInt("con")!;
      id = pref.getInt("id")!;
      firstOpen = pref.getBool("firstOpen")!;
    });
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
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            next: const Icon(
              Icons.arrow_forward,
              color: Colors.red,
            ),
            done: const Text('Done',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            controlsMargin: const EdgeInsets.all(10),
            controlsPadding: const EdgeInsets.all(4),
            dotsDecorator: const DotsDecorator(
              size: Size(60.0, 10.0),
              color: Colors.red,
              activeSize: Size(22.0, 10.0),
              activeColor: Colors.white,
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
            dotsContainerDecorator: const ShapeDecoration(
              color: Colors.black54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
              ),
            ),
          )
        : WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              body: SizedBox(
                height: size.height,
                width: double.infinity,
              ),
            ),
          );
  }
}
