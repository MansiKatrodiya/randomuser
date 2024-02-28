import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Nationalize extends StatefulWidget {
  const Nationalize({super.key});

  @override
  State<Nationalize> createState() => _NationalizeState();
}

class _NationalizeState extends State<Nationalize> {
  List countryDataList = [];

  getCountryDate() async {
    try {
      var res = await http
          .get(Uri.parse("https://api.nationalize.io?name=nathaniel"));
      var data1 = jsonDecode(res.body);
      countryDataList = data1["country"];
      debugPrint("----Require Data---->$countryDataList");
      setState(() {});
    } catch (e) {
      debugPrint("Require not found $e");
    }
  }

  @override
  void initState() {
    getCountryDate();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          GridView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: countryDataList.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 08, mainAxisSpacing: 08),
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.pink),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "${countryDataList[index]["country_id"]}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        "${countryDataList[index]["probability"]}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
