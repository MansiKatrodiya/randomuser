import 'package:flutter/material.dart';
import 'package:rendomuser/universities/universities.dart';
import 'package:rendomuser/zippopotam/zippopotam.dart';
import 'agify/agify.dart';
import 'bored/bored.dart';
import 'cat_fact_api/cat.dart';
import 'catageris/catageris.dart';
import 'coin_desk/coin_desk.dart';
import 'data_usa/data_usa.dart';
import 'dogs/dogs.dart';
import 'genderize_io/genderize.dart';
import 'ipify/ipify.dart';
import 'ipinfo/ipinfo.dart';
import 'jokes/jokes.dart';
import 'nationalize/nationalize.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dogs(),
    );
  }
}

