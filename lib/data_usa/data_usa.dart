import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Mansii extends StatefulWidget {
  const Mansii({super.key});

  @override
  State<Mansii> createState() => _MansiiState();
}

class _MansiiState extends State<Mansii> {
  List dataUsaList = [];

  getAllData() async {
    try {
      var res = await http.get(Uri.parse(
          "https://datausa.io/api/data?drilldowns=Nation&measures=Population"));
      var data = jsonDecode(res.body);
      dataUsaList = data["data"];
      debugPrint("$dataUsaList");
      setState(() {});
    } catch (e) {
      debugPrint("Error=$e");
    }
  }

  @override
  void initState() {
    getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5, crossAxisSpacing: 5, crossAxisCount: 3),
            shrinkWrap: true,
            itemCount: dataUsaList.length,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                child: Column(
                  children: [
                    Text(
                      "${dataUsaList[index]["ID Nation"]}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${dataUsaList[index]["Nation"]}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${dataUsaList[index]["ID Year"]}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${dataUsaList[index]["Year"]}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${dataUsaList[index]["Population"]}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${dataUsaList[index]["Slug Nation"]}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    // Text("${dataUsaList.length}")
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
