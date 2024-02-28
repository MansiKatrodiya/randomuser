import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Bored extends StatefulWidget {
  const Bored({super.key});

  @override
  State<Bored> createState() => _BoredState();
}

class _BoredState extends State<Bored> {
  Map boredMap = {};

  getBoredData() async {
    try {
      var res =
          await http.get(Uri.parse("https://www.boredapi.com/api/activity"));
      var data = jsonDecode(res.body);
      boredMap = data;
      debugPrint("$boredMap");
      setState(() {});
    } catch (e) {
      debugPrint("-----Error----->$boredMap");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const Text(
                      "activity =",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${boredMap["activity"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Text(
                    "type =",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  Text(
                    "${boredMap["type"]}",
                    style: const TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "participants =",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  Text(
                    "${boredMap["participants"]}",
                    style: const TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "price =",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  Text(
                    "${boredMap["price"]}",
                    style: const TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const Text(
                      "link =",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${boredMap["link"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Text(
                    "key =",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  Text(
                    "${boredMap["key"]}",
                    style: const TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "accessibility =",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  Text(
                    "${boredMap["accessibility"]}",
                    style: const TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ],
              ),
              GestureDetector(
                  onTap: () {
                    getBoredData();
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.add, size: 50, color: Colors.black),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
