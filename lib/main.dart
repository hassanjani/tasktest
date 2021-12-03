import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasktest/UIScreens/Homepage.dart';
import 'package:tasktest/UIScreens/Screen1.dart';
import 'models/TodoModel.dart';

Future<void> main() async {
 // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider.value(
        value: TodoModel(),
      ),
      ChangeNotifierProvider.value(
        value: S_index(),
      ),

    ],
        child:

        MaterialApp(
          title: 'Flutter Task',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Homepage (),

        ));
  }
}
