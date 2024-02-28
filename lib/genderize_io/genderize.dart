

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Genderize extends StatefulWidget {
  const Genderize({super.key});

  @override
  State<Genderize> createState() => _GenderizeState();
}

class _GenderizeState extends State<Genderize> {
  Map genderizeMap = {};

  getGenderizeData() async {
    try {
      var res = await http.get(Uri.parse("https://api.genderize.io?name=luc"));
      var data = jsonDecode(res.body);
      genderizeMap = data;
      debugPrint("$genderizeMap");
      setState(() {});
    } catch (e) {
      debugPrint("-----Error----->$genderizeMap");
    }
  }

  @override
  void initState() {
    getGenderizeData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "count =",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                Text(
                  "${genderizeMap["count"]}",
                  style: const TextStyle(color: Colors.black, fontSize: 30),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "name =",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                Text(
                  "${genderizeMap["name"]}",
                  style: const TextStyle(color: Colors.black, fontSize: 30),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "gender =",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                Text(
                  "${genderizeMap["gender"]}",
                  style: const TextStyle(color: Colors.black, fontSize: 30),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "probability =",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                Text(
                  "${genderizeMap["probability"]}",
                  style: const TextStyle(color: Colors.black, fontSize: 30),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}