import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UniversitiesList extends StatefulWidget {
  const UniversitiesList({super.key});

  @override
  State<UniversitiesList> createState() => _UniversitiesListState();
}

class _UniversitiesListState extends State<UniversitiesList> {
  List universitiesLis = [];

  getAllUniversitiesList() async {
    try {
      var res = await http.get(Uri.parse(
          "http://universities.hipolabs.com/search?country=United+States&limit=20"));
      var data = jsonDecode(res.body);
  universitiesLis = data;

  setState(() {});
    } catch (e) {
      debugPrint("Error = $e");
    }
  }

  @override
  void initState() {
    getAllUniversitiesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Universities",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: universitiesLis.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent:300, crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemBuilder: (ctx, i) {
                  return Center(
                    child: Container(
                      height: 350,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pink,
                        border: Border.all(width: 2, color: Colors.black),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "${universitiesLis[i]["name"]}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${universitiesLis[i]["country"]}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${universitiesLis[i]["state-province"]}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${universitiesLis[i]["alpha_two_code"]}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),

                          Container(height: 50,color: Colors.yellow,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: universitiesLis[i]["web_pages"].length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (ctx, index) {
                                return Text(
                                  "${universitiesLis[i]["web_pages"][index]}",
                                  style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w500),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            color: Colors.green,height: 50,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: universitiesLis[i]["domains"].length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (ctx, ind) {
                                return Text(
                                  "${universitiesLis[i]["domains"][ind]}",
                                  style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w500),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}