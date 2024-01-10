import 'package:flutter/material.dart';
import 'package:meals/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IfStatic',
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var screens = [];
  var _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 248, 191, 191),
                Color.fromARGB(255, 250, 250, 250)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: HomeScreen()),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(color: Colors.red, fontSize: 12),
          onTap: (index) {
            _selectedPageIndex = index;
          },
          currentIndex: _selectedPageIndex,

          fixedColor: const Color.fromARGB(255, 250, 41, 26),

          // showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/homeLogo.png",
                scale: 0.85,
              ),
              // backgroundColor: Colors.white,
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/2ndLogo.png",
                scale: 0.85,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              // icon: Image.asset(
              //   "assets/homeLogo.png",
              //   scale: 0.85,
              // ),
              //   scale: 0.85,
              icon: Image.asset(
                "assets/3rdLogo.png",
                scale: 4,
                alignment: Alignment.topCenter,
              ),
              // backgroundColor: Colors.amber,
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/4thLogo.png",
                scale: 0.85,
              ),
              // backgroundColor: Colors.amber,
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/5thLogo.png",
                scale: 0.85,
              ),
              // backgroundColor: Colors.amber,
              label: '',
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: EdgeInsets.only(top: 10),
          height: 64,
          width: 64,
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: Color.fromRGBO(201, 0, 0, 1),
            onPressed: () {},
            child: Image.asset("assets/3rdLogo.png"),
            shape: CircleBorder(
                side: BorderSide(
              width: 3,
              color: Color.fromRGBO(201, 0, 0, 1),
            )),
          ),
        ));
  }
}
