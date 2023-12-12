import 'package:azeala_hotel/Pages/Splash%20Screens/splashscreen3.dart';
import 'package:azeala_hotel/Pages/auth/component/my_textfield.dart';
import 'package:azeala_hotel/Pages/auth/component/mybutton.dart';
import 'package:azeala_hotel/Pages/auth/component/squaretile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  void Function()? onTap;
  SignUp({super.key, required this.onTap, required});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //Sign User In
  void signUserUp() async {
    //Show the loading circle

    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      if (passwordcontroller.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text,
          password: passwordcontroller.text,
        );
      } else {
        //show the error message
        SnackBar(content: Text("Password don't match"));
      }
      // pop the loading circle

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == "user-not-found") {
        wrongEmailMessage();
      } else if (e.code == "wrong-password") {
        wrongPasswordMessage();
      }
    }
  }

  //For wrong email
  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Wrong email address"),
          );
        });
  }

  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Wrong password"),
          );
        });
  }

// controller for the text
  final emailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

          // backgroundColor: Colors.grey.shade200,

          body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/Alojnabathtub.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          ListView(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //logo
                    const SizedBox(
                      height: 45,
                    ),
                    const Icon(
                      Icons.lock,
                      size: 80,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    //Text

                    const Text(
                      "Welcome to Alojna Hotel ",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),

                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Welcome to the family, kindly Sign Up",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w100,
                          color: Colors.white),
                    ),

                    const SizedBox(
                      height: 25,
                    ),
                    //username textfield
                    MyTextfield(
                      controller: emailcontroller,
                      hintText: 'Email',
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

                    const SizedBox(
                      height: 25,
                    ),
                    // confirm password textfield
                    MyTextfield(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                    ),

                    //forgot password

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SplashScreen3()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 10, right: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Forgot Password ?",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),

                    //sign In button
                    const SizedBox(
                      height: 16,
                    ),

                    MyButton(
                      onTap: signUserUp,
                      signInText: ("Sign Up"),
                    ),

                    const SizedBox(
                      height: 31,
                    ),

                    //or with
                    const Row(
                      children: <Widget>[
                        Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "Or continue with",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ))
                      ],
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    //google or apple

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SquareTile(imagePath: "images/googlelogo.png"),
                        SizedBox(
                          width: 10,
                        ),
                        SquareTile(imagePath: "images/applelogo.png")
                      ],
                    ),

                    const SizedBox(
                      height: 50,
                    ),
                    //not yet a member ? register now

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Already have an account,",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            " Sign In Now",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
