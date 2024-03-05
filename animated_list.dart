import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedListPage(),
    );
  }
}

class AnimatedListPage extends StatefulWidget {
  const AnimatedListPage({super.key});

  @override
  State<AnimatedListPage> createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage> {

  double screenHeight = 0;
  double screenWidth = 0;

  bool startAnimation = false;

  List<String> countries = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla", "Argentina","Armenia","Aruba"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth / 20
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: countries.length,
              itemBuilder: (context, index) {
                return item(index);
              },
            )
          ],
        )
      ),
    );
  }

  Widget item(int index) {
    return AnimatedContainer(
      height: 70,
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 1000 + (index * 100)),
      transform: Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth / 20
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${index + 1}. ${countries[index]}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }

}


