import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Agify extends StatefulWidget {
  const Agify({super.key});

  @override
  State<Agify> createState() => _AgifyState();
}

class _AgifyState extends State<Agify> {

  Map agifyMap = {};

  getAgifyData() async {
    try {
      var res = await http.get(Uri.parse("https://api.agify.io?name=meelad"));
      var data = jsonDecode(res.body);
      agifyMap = data;
      debugPrint("$agifyMap");
      setState(() {});
    } catch (e) {
      debugPrint("-----Error----->$agifyMap");
    }
  }

  @override
  void initState() {
    getAgifyData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(top: 100,right: 240),
                child: Row(
                  children: [
                    const Text(
                      "count =",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${agifyMap["count"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                const Text(
                  "name =",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                Text(
                  "${agifyMap["name"]}",
                  style: const TextStyle(color: Colors.black, fontSize: 30),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "age =",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                Text(
                  "${agifyMap["age"]}",
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