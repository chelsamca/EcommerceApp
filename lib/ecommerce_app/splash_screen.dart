
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectapp/ecommerce_app/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin
{
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds:4 ),() {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => WelcomeScreen()
          ));
    });

  }

  @override
  void dispose(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays:SystemUiOverlay.values);
    super.dispose();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue,Colors.purpleAccent],
          // begin: Alignment.topRight,
          // end: Alignment.bottomLeft
        ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset('assets/images/online-shopping.jpg'),
            //  Icon(Icons.shopping_cart, size: 80, color: Colors.white54,),

            SizedBox(height: 20,),
            Text('Six Pack App',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 39
              ),)
          ],
        ),
      ),
        bottomNavigationBar:
      SizedBox(height: 30,
      child: Text('powered by pursuits',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black),
      ),
      ),
    );
  }
}





//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin
// {
//
//   late AnimationController _animationController;
//
//   @override
//
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//         vsync: this,
//     duration: Duration(seconds: 2),
//     );
//     _animationController.forward();
//     Timer(Duration(seconds:3), () {
//
//     });
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightGreen,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ScaleTransition(
//               Scale: Tween(begin: 0,end: 1).animate(
//               CurvedAnimation(
//                   parent: _animationController,
//                   curve: Curves.easeOut
//               ),
//             ),
//               child: Image.asset('images/logo.png', height: 150,),
//             ),
//             SizedBox(height: 50,),
//             Text('My ecommerce app',
//               style: TextStyle(
//                 fontWeight:FontWeight.bold,
//               fontSize: 30,
//               color: Colors.black),)
//           ],
//         ),
//       ),
//     );
  