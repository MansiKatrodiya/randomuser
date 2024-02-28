import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Mnu extends StatefulWidget {
  const Mnu({super.key});

  @override
  State<Mnu> createState() => _MnuState();
}

class _MnuState extends State<Mnu> {
  List reqresUserList = [];


  getAllReqresUser() async {
    try {
      var res =
          await http.get(Uri.parse("https://reqres.in/api/usersF?per_page=10"));

      var data = jsonDecode(res.body);
      reqresUserList = data["data"];
      debugPrint("$reqresUserList");
      setState(() {});
    } catch (e) {
      debugPrint("require not found $e");
    }
  }

  @override
  void initState() {
    getAllReqresUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(08),
            itemCount: reqresUserList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 5, mainAxisSpacing: 5, crossAxisCount: 3),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 5),
                      color:Color(int.parse(reqresUserList[index]["color"]
                          .toString()
                          .replaceAll("#", "0XFF"))),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    "${reqresUserList[index]["name"]}",
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  )),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
