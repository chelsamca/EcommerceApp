
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/ecommerce_app/signup_screen.dart';

import '../logo_widget/reusable_codelogo.dart';
import '../utils/color_utils.dart';
import 'homieee.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")
              ],begin: Alignment.topCenter,end: Alignment.bottomCenter
          ),
        ),

        child:SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.fromLTRB(500, 200, 500, 500),
          child: Column(
            children: <Widget>[logoWidget("assets/images/online.png"),

              SizedBox(height: 20,),
              reusableTextField("Enter UserEmail",
                  Icons.person_2_outlined, false, emailController),
              SizedBox(height: 20,),
              reusableTextField("Enter Password",
                  Icons.lock_outline, true, passwordController),
              SizedBox(height: 20,),
              signInSignUpButton(context,true, () {

                FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text).then((value) {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Homieee()));
                })
                    .onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });

              }),
              signUpOption()
            ],
          ),
        )
      ),
    ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Text("Don't Have Account ?",
          style: TextStyle(color: Colors.white70),),

        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => SignUP()));
          },
          child: Text("Sign Up",style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold),),
        )
      ],
    );
  }
}





