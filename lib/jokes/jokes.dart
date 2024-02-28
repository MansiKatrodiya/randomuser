import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Jokes extends StatefulWidget {
  const Jokes({super.key});
  @override
  State<Jokes> createState() => _JokesState();
}
class _JokesState extends State<Jokes> {
  Map jokeMap = {};

  getAlljokMap() async {
    try {
      var res = await http.get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));
      var data = jsonDecode(res.body);
      jokeMap = data;
      debugPrint("=======> $jokeMap");
      setState(() {});
    } catch (e) {
      debugPrint("Error = $e");
    }
  }
  @override
  void initState() {
    getAlljokMap();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height:80),
          Center(
            child: Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.greenAccent,
                border: Border.all(width: 2, color: Colors.black),
              ),
              child: Column(
                children: [
                  const Text(
                    "Jokes",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${jokeMap["type"]}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${jokeMap["setup"]}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${jokeMap["punchline"]}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${jokeMap["id"]}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50,),
          GestureDetector(
            onTap: () {
              getAlljokMap();
              setState(() {
              });
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.redAccent,

              ),
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}




