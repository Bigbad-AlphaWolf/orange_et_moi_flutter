import 'package:flutter/material.dart';
import 'package:orange_et_moi/pages/HomeScreen/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
            inputDecorationTheme: const InputDecorationTheme(
              floatingLabelStyle: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 255, 121, 0)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 255, 121, 0)), //<-- SEE HERE
              ),
            )),
        home: const HomeScreen(),
      ),
    );
  }
}
