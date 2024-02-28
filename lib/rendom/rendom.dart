import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  List randomUserList = [];

  getAllRendomUser() async {
    try {
      var res =
          await http.get(Uri.parse("https://randomuser.me/api/?results=2"));
      debugPrint("https://randomuser.me/api/?results=2");
      var data = jsonDecode(res.body);
      debugPrint("StatusCode = ${res.statusCode}");
      randomUserList.addAll(data["results"]);
    } catch (e) {
      debugPrint("Error=$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            itemCount: randomUserList.length,
            padding: const EdgeInsets.all(08),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
            itemBuilder: (context, index) {
              return Container(
                height: 60,
                // width: 60,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.centerLeft,
                        colors: [
                          Colors.black,
                          Colors.amberAccent,
                          Colors.cyan,
                          Colors.deepOrange,
                          Colors.deepPurple,

                        ]),
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)),
                child: Center(
                    child: CachedNetworkImage(
                  imageUrl: "${randomUserList[index]["picture"]["large"]}",
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )),
              );
            },
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () async {
          await getAllRendomUser();
          setState(() {});
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
