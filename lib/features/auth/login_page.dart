import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/auth_services.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: GestureDetector(
            onTap: () async {
              // await ref.read(authServiceProvider).singInWithGoogle();
              await AuthService().signInWithGoogle();
            },
            child: SizedBox(
                height: 60,
                child: Image.asset('assets/images/signinwithgoogle.png')),
          ),
        ),
      ),
    );
  }
}
