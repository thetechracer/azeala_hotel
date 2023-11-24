import 'package:azeala_hotel/Pages/Splash%20Screens/splashscreen3.dart';
import 'package:azeala_hotel/Pages/auth/component/my_textfield.dart';
import 'package:azeala_hotel/Pages/auth/component/mybutton.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
// controller for the text

  final usercontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      // backgroundColor: Colors.grey.shade200,
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            //logo

            const Icon(
              Icons.lock,
              size: 100,
            ),
            const SizedBox(
              height: 25,
            ),

            //Text

            const Text(
              "Welcome to Alojna Hotel ",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Kindly Sign In to enjoy our services.",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w100),
            ),

            const SizedBox(
              height: 20,
            ),
            //username textfield
            MyTextfield(
              controller: usercontroller,
              hintText: 'Username',
              obscureText: false,
            ),

            const SizedBox(
              height: 25,
            ),
            // password textfield
            MyTextfield(
              controller: passwordcontroller,
              hintText: 'Password',
              obscureText: true,
            ),

            //forgot password

            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SplashScreen3()));
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[Text("Forgot Password ?")],
                ),
              ),
            ),

            //sign In button
            const SizedBox(
              height: 15,
            ),

            MyButton(
              onTap: () {},
              signInText: ("Sign In"),
            ),

            //or with

            //google or apple

            //not yet a member ? register now
          ],
        ),
      ),
    ));
  }
}
