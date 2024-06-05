// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// final authServiceProvider = Provider(
//   (ref) => AuthService(
//     auth: FirebaseAuth.instance,
//     googleSignIn: GoogleSignIn(),
//   ),
// );

// class AuthService {
//   FirebaseAuth auth;
//   GoogleSignIn googleSignIn;
//   AuthService({required this.auth, required this.googleSignIn});

//   singInWithGoogle() async {
//     final user = await googleSignIn.signIn();
//     final googleAuth = await user!.authentication;
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//     await auth.signInWithCredential(credential);
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    return userCredential.user;
  }
}
