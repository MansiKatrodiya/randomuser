import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Davra extends StatefulWidget {
  const Davra({super.key});

  @override
  State<Davra> createState() => _DavraState();
}

class _DavraState extends State<Davra> {
  Map catFact = {};

  getAllCatFact() async {
    var res = await http.get(Uri.parse("https://catfact.ninja/fact"));
    // debugPrint("https://catfact.ninja/fact");
    var data = jsonDecode(res.body);
    catFact = data;
    // debugPrint("------->$catFact");
    setState(() {});
  }

  @override
  void initState() {
    getAllCatFact();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height /1.4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.pink, border: Border.all(color: Colors.green)),
            child: Column(
              children: [
                Column(
                  children: [
                    const Text(
                      "Facts",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    Text("${catFact["fact"]}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                  ],
                ),
                const SizedBox(height: 40),
                Column(
                  children: [
                    const Text("Length",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text("${catFact["length"]}",
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          InkWell(
            onTap: () {
              getAllCatFact();
              setState(() {});
            },
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.yellow,
                  border: Border.all(color: Colors.black)),
              child: const Icon(Icons.add,color: Colors.black,size:50),

            ),
          )
        ],
      ),
    );
  }
}
