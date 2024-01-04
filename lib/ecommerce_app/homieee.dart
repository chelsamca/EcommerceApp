import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/ecommerce_app/signin_screen.dart';

class Homieee extends StatefulWidget {
  const Homieee({super.key});

  @override
  State<Homieee> createState() => _HomieeeState();
}

class _HomieeeState extends State<Homieee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Logout"),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SignIn()));
            });

          },
        ),
      ),
    );
  }
}


