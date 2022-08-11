import 'package:finaltwo/pages/login_page.dart';
import 'package:finaltwo/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DecisionsTree extends StatefulWidget {
  const DecisionsTree({Key? key}) : super(key: key);

  @override
  State<DecisionsTree> createState() => _DecisionsTreeState();
}

class _DecisionsTreeState extends State<DecisionsTree> {
  User? user;
  
  @override
  void initState() {
    super.initState();
    onRefresh(FirebaseAuth.instance.currentUser);
  }

  onRefresh(userCred) {
    setState(() {
      user = userCred;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(user == null)
      {
        return LoginPage(
          onSignIn : (userCred) => onRefresh(userCred),
        );
      }
    return ProfilePage(onSignOut: (userCred) => onRefresh(userCred),);
  }
}
