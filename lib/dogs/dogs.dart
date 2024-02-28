import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dogs extends StatefulWidget {
  const Dogs({super.key});

  @override
  State<Dogs> createState() => _DogsState();
}

class _DogsState extends State<Dogs> {
  List dogsList = [];

  getdata() async {
    try {
      var res = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
      dogsList.add(jsonDecode(res.body));
      debugPrint("-------${res.statusCode}");

      debugPrint("-------$dogsList");

      setState(() {});
    } catch (e) {
      debugPrint("Error---$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text("DOGS", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dogsList.length,
            padding: const EdgeInsets.all(10),
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 10, mainAxisExtent: 200, crossAxisSpacing: 10),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.blue,
                    child: CachedNetworkImage(
                      imageUrl: '${dogsList[index]["message"]}',
                      fit: BoxFit.fill,
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error_outline, color: Colors.pinkAccent),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Status =  ${dogsList[index]['status']}',
                    style: const TextStyle(fontSize: 15),
                  )
                ],
              );
            },
          )
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pinkAccent,
          onPressed: () {
            getdata();
            setState(() {});
          },
          child: const Icon(
            Icons.add,
            size: 50,
          )),
    );
  }
}