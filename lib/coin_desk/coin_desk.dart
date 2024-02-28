import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoinDesk extends StatefulWidget {
  const CoinDesk({super.key});

  @override
  State<CoinDesk> createState() => _CoinDeskState();
}

class _CoinDeskState extends State<CoinDesk> {
  Map coinDeskMap = {};

  getCoinDeskData() async {
    try {
      var res = await http.get(Uri.parse("https://api.coindesk.com/v1/bpi/currentprice.json"));
      var data = jsonDecode(res.body);
      coinDeskMap = data;
      debugPrint("$coinDeskMap");
      setState(() {});
    } catch (e) {
      debugPrint("-----Error----->$coinDeskMap");
    }
  }

  @override
  void initState() {
    getCoinDeskData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children:  [
                      const Text("time",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      const Text("updated", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                      Text(
                        "${coinDeskMap["time"]["updated"]}",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const Text(
                        "updateduk",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                      Text(
                        "${coinDeskMap["time"]["updateduk"]}",
                        style: const TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      const Text(
                        "updatedISO",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                      Text(
                        "${coinDeskMap["time"]["updatedISO"]}",
                        style: const TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.orange),
                child: Column(
                  children: [

                    const Text(
                      "disclaimer",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${coinDeskMap["disclaimer"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.orange),
                child: Column(
                  children: [
                    const Text(
                      "chartName",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${coinDeskMap["chartName"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.orange),
                child: Column(
                  children: [
                    const Text("BPI",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    const Text("UsD",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    const Text(
                      "code",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${coinDeskMap["bpi"]["USD"]["code"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    const Text(
                      "symbol",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${coinDeskMap["bpi"]["USD"]["symbol"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    const Text(
                      "rate",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${coinDeskMap["bpi"]["USD"]["rate"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    const Text(
                      "description",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${coinDeskMap["bpi"]["USD"]["description"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    const Text(
                      "rate_float",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${coinDeskMap["bpi"]["USD"]["rate_float"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.orange),
                child: Column(
                  children: [
                    const Text("BPI",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    const Text("GBP",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    const Text(
                      "code",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${coinDeskMap["bpi"]["GBP"]["code"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    const Text(
                      "symbol",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${coinDeskMap["bpi"]["GBP"]["symbol"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    const Text(
                      "rate",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${coinDeskMap["bpi"]["GBP"]["rate"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    const Text(
                      "description",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${coinDeskMap["bpi"]["GBP"]["description"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    const Text(
                      "rate_float",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${coinDeskMap["bpi"]["GBP"]["rate_float"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.orange),
                child: Column(
                  children: [
                    const Text("BPI",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    const Text("EUR",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    const Text(
                      "code",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${coinDeskMap["bpi"]["EUR"]["code"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    const Text(
                      "symbol",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${coinDeskMap["bpi"]["EUR"]["symbol"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    const Text(
                      "rate",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${coinDeskMap["bpi"]["EUR"]["rate"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    const Text(
                      "description",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${coinDeskMap["bpi"]["EUR"]["description"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    const Text(
                      "rate_float",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "${coinDeskMap["bpi"]["EUR"]["rate_float"]}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  getCoinDeskData();
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(40)),
                    child: const Icon(Icons.add, size: 50, color: Colors.black),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}