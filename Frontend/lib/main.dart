import "package:flutter/material.dart";
import "package:testapp/pages/crud.dart";
import "package:testapp/pages/home.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyApp createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  int pageIndex = 0;

  void navigation(index) {
    setState(() {
      pageIndex = index;
    });
  }

  List pages = [
    new Home(),
    new Crud(),
  ];

  @override
  Widget build(BuildContext context) {
    return (MaterialAppMain());
  }

  MaterialApp MaterialAppMain() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: pages[pageIndex],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(const TextStyle(
              fontWeight: FontWeight.bold,
            )),
          ),
          child: Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 8.0,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: NavigationBar(
              selectedIndex: pageIndex,
              backgroundColor: Colors.transparent,
              indicatorColor: const Color.fromARGB(90, 64, 195, 255),
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                NavigationDestination(icon: Icon(Icons.add), label: "Crud"),
              ],
              onDestinationSelected: (int index) {
                navigation(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
