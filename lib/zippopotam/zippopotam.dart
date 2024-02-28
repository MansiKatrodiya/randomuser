import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Zippopotam extends StatefulWidget {
  const Zippopotam({super.key});

  @override
  State<Zippopotam> createState() => _ZippopotamState();
}

class _ZippopotamState extends State<Zippopotam> {
  List zippopotamList = [];

  getAllZippopotamList() async {
    try {
      var res = await http.get(Uri.parse("https://api.zippopotam.us/us/33162"));

      debugPrint("https://api.zippopotam.us/us/33162");

      var data = jsonDecode(res.body);

      zippopotamList = data["places"];
      debugPrint("=======> $zippopotamList");

      setState(() {});
    } catch (e) {
      debugPrint("Error = $e");
    }
  }

  @override
  void initState() {
    getAllZippopotamList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: const Text(
          "Zippopotam",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: zippopotamList.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
              itemBuilder: (ctx, i) {

                return Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: Card(
                    color: Colors.amber,elevation:20,
                    child: Column(
                      children: [
                        Text(
                          "place name: ${zippopotamList[i]["place name"]}",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "longitude: ${zippopotamList[i]["longitude"]}",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "state: ${zippopotamList[i]["state"]}",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "state abbreviation: ${zippopotamList[i]["state abbreviation"]}",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "latitude: ${zippopotamList[i]["latitude"]}",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),

                      ],
                    ),
                  ),
                );

              },
            ),
          ],
        ),
      ),
    );
  }
}



