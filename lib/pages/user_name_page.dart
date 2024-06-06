import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/repository/user_data_services.dart';

class UserNamePage extends ConsumerStatefulWidget {
  final String disPlayName;
  final String email;
  final String profilePic;

  const UserNamePage({
    super.key,
    required this.disPlayName,
    required this.email,
    required this.profilePic,
  });

  @override
  ConsumerState<UserNamePage> createState() => _UserNamePageState();
}

class _UserNamePageState extends ConsumerState<UserNamePage> {
  final TextEditingController userNameControlaller = TextEditingController();
  bool isValid = true;
  void getUserName() async {
    final usersMap = await FirebaseFirestore.instance.collection('user').get();
    final users = usersMap.docs.map((user) => user).toList();

    for (var element in users) {
      if (userNameControlaller.text == element.data()['userName']) {
        isValid == false;
        setState(() {});
      } else {
        isValid == true;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 26, horizontal: 14),
                child: Text('Enter User Name'),
              ),
              Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      validator: (value) {
                        return isValid ? null : "UserName Alrady token";
                      },
                      onChanged: (value) {
                        getUserName();
                      },
                      controller: userNameControlaller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'UserName',
                        suffixIcon: const Icon(
                          Icons.verified,
                        ),
                        suffixIconColor: isValid ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  isValid
                      ? ref.read(userDataServicesProvider).addUserDataFireStore(
                            disPlayName: widget.disPlayName,
                            // userName: widget.userName,
                            email: widget.email,
                            profilePic: widget.profilePic, userName: userNameControlaller.text,
                            description: '',
                            // subscriptions: widget.subscriptions,
                            // videos: widget.videos,
                            // userId: widget.userId,
                            // description: widget.description,
                            // type: widget.type,
                          )
                      : null;
                  getUserName();
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green,
                  ),
                  child: const Center(
                    child: Text(
                      'Click Me',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
