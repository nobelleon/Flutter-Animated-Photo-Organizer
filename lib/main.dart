import 'package:animated_photo_organizer/src/pages/screens/beranda.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/widgets/draggable_photo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PhotoProvider(),
      child: MaterialApp(
        title: 'Animated Photo Organizer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const Beranda(),
      ),
    );
  }
}
