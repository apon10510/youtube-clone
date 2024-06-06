import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/login_page.dart';
import 'package:youtube_clone/pages/home_page.dart';
import 'package:youtube_clone/pages/user_name_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube clone',
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return const LoginPage();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
         return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('user')
                  .doc(
                    FirebaseAuth.instance.currentUser!.uid,
                  )
                  .snapshots(),
              builder: (b, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData || !snapshot.data!.exists) {
                  final user = FirebaseAuth.instance.currentUser;
                  return UserNamePage(
                    disPlayName: user!.displayName!,
                    email: user.displayName!,
                    profilePic: user.displayName!,
                  );
                }else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }else{
            return const HomePage();
          }

              });
        },
      ),
    );
  }
}
