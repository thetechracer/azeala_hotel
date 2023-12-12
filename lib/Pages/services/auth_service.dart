import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //Google sign in

  signInwithGoogle() async {
    //being interactive sign in process

    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain the auth details from request

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for User

    final Credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // finally, lets sign in
    return await FirebaseAuth.instance.signInWithCredential(Credential);

    // final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // final GoogleSignInAuthentication googleAuth =
    //     await googleUser.authentication;
    // final AuthCredential credential = GoogleAuthProvider.getCredential(
    //   accessToken: googleAuth.accessToken,
    //   idToken: googleAuth.idToken,
    // );
    // final UserCredential userCredential =
    //     await FirebaseAuth.instance.signInWithCredential(credential);
    // final User user = userCredential.user;
    // return user;
  }
}
