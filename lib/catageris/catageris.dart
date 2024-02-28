import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Bnsi extends StatefulWidget {
  const Bnsi({super.key});

  @override
  State<Bnsi> createState() => _BnsiState();
}

class _BnsiState extends State<Bnsi> {
  List mansiList = [];
  List categoryList = [];
  List animalList = [];

  getAllcategriesUser() async {
    try {
      var res = await http.get(Uri.parse("https://api.publicapis.org/entries"));

      var data = jsonDecode(res.body);

      mansiList = data["entries"];
      // debugPrint("----public--->$mansiList");

      for (var i = 0; i < mansiList.length; i++) {
        if (categoryList.contains(mansiList[i]["Category"])) {

        } else {
          categoryList.add("${mansiList[i]["Category"]}");
        }
      }

      for (int i = 0; i < mansiList.length; i++) {
        if ((mansiList[i]['Category']) == 'Animals') {
          animalList.add(mansiList[i]);
          debugPrint("${animalList.length}");
        }
      }

      setState(() {});
    } catch (e) {
      debugPrint("Error=$e");
    }
  }

  @override
  void initState() {
    getAllcategriesUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          GridView.builder(
            itemCount: animalList.length,
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    border: Border.all(color: Colors.black)),
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      "${animalList[index]["API"]}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("${animalList.length}")
                  ],
                )
              ),
              );
            },
          )
        ],
      ),
    );
  }
}
