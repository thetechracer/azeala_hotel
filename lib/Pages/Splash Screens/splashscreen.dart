import 'package:azeala_hotel/Pages/Splash%20Screens/splashcreen1.dart';
import 'package:azeala_hotel/Pages/Splash%20Screens/splashscreen2.dart';
import 'package:azeala_hotel/Pages/Splash%20Screens/splashscreen3.dart';
import 'package:azeala_hotel/Pages/Splash%20Screens/splashscreen4.dart';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple[200],
        body: Stack(
          children: <Widget>[
            SizedBox(
              child: PageView(
                controller: _controller,
                children: [
                  Splashscreen1(),
                  SplashScreen2(),
                  SplashScreen3(),
                  SplashScreen4(),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 830),
                  child: Center(
                    child: SmoothPageIndicator(
                        controller: _controller,
                        count: 4,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Colors.blueGrey,
                          dotColor: Colors.grey,
                          dotHeight: 20.0,
                          dotWidth: 20,
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
