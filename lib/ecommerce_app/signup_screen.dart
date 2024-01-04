import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/logo_widget/reusable_codelogo.dart';

import '../utils/color_utils.dart';
import 'homieee.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Create Your Account",
          style: TextStyle(
            fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")
              ],begin: Alignment.topCenter,end: Alignment.bottomCenter
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
              padding:EdgeInsets.fromLTRB(20,
                  MediaQuery.of(context).size.height * 0.2,20,0),
            child: Column(
              children: <Widget> [

                SizedBox(height: 20,),
                reusableTextField("Enter UserName",
                    Icons.person_2_outlined, false, userNameController),
                SizedBox(height: 20,),
                reusableTextField("Enter Email_Id",
                    Icons.email_outlined, false, emailController),
                SizedBox(height: 20,),
                reusableTextField("Enter Password",
                    Icons.lock_outline, false, passwordController),
                SizedBox(height: 20,),

                signInSignUpButton(context,false,() {

                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text)
                      .then((value)  {
                  Navigator.push(context,MaterialPageRoute(
                  builder: (context) => Homieee()));
                  })
                      .onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });

                })


              ],

            ),
          ),),

      ),
    );
  }
}
