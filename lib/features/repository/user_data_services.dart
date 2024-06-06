import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/model/user_model.dart';

final userDataServicesProvider = Provider(
  (ref) => UserDataServices(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class UserDataServices {
  FirebaseAuth auth;
  FirebaseFirestore firestore;
  UserDataServices({required this.auth, required this.firestore});

  addUserDataFireStore({
   required String disPlayName,
    required String userName,
    required String email,
    required String description,
    required String profilePic,
  }) async {
    UserModel user = UserModel(
      disPlayName: disPlayName,
      userName: userName,
      email: email,
      profilePic: profilePic,
      subscriptions: [],
      videos: 0,
      userId: auth.currentUser!.uid,
      description: description,
      type: "user",
    );
    await firestore
        .collection('user')
        .doc(auth.currentUser!.uid)
        .set(user.toJson());
  }
}
