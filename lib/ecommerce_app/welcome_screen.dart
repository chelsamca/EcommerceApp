import 'package:flutter/material.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final _PageController = PageController();
  int _currentPage = 0;

  List <WelcomeSlider> welcomeSlider = [
    WelcomeSlider(
        title: 'Shop All You Want !',
        description: 'Select From a Wide Range of Variety ',
        image:'assets/images/shopimg.jpg'),
    WelcomeSlider(
        title: 'Save Time, Order Online !',
        description: 'Convenience at Your FingerTips',
        image: 'assets/images/shop1.jpeg'),
    WelcomeSlider(
        title: 'The Greatest Shop Journey !',
        description: 'Make a Practical Choice With One Voice',
        image: 'assets/images/online-shopping.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeScreen()));
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _PageController,
                    itemCount: welcomeSlider.length,
                    onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                    },
                    itemBuilder: (context, index) {
                     final item = welcomeSlider[index];
                      return Column(children: [
                        Image.asset(
                          item.image,
                          height: 300,
                        ),
                        SizedBox(height: 10,),
                        Text(
                          item.title,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          item.description,
                          style: TextStyle(
                              color: Color.fromARGB(255, 94, 92, 92),
                              fontSize: 20),
                        )
                      ]);
                    }),
              ),
              Row(
                  children: List.generate(3, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 10,
                    width: _currentPage == index ? 30 : 10,
                    decoration: BoxDecoration(
                        color: _currentPage == index ? Colors.red : Colors.grey ,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                );
              }))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          if (_currentPage < welcomeSlider.length -1) {
            _PageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut);
          } else {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomeScreen()));
          }
        },
        child: _currentPage  != welcomeSlider.length -1
            ? Icon(Icons.arrow_forward) : Icon(Icons.done),
      ),
    );
  }
}

class WelcomeSlider {
  final String title;
  final String description;
  final String image;

  WelcomeSlider(
      {required this.title,
        required this.description,
        required this.image});
}
