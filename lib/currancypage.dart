import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:http/http.dart' as http;

import 'global.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {

   double result = 0.0;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: h / 3,
              width: w,
              decoration: const BoxDecoration(
                color: Color(0xff6D98FD),
              ),
              child: SafeArea(
                top: true,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    "Currency Converter",
                    style: GoogleFonts.lato(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 1.5),
                  ),
                ),
              ),
            ),
            Container(
              height: h - 292,
              width: w,
              padding: EdgeInsets.only(top: 50),
              child: GridView.count(
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1.1,
                crossAxisCount: 3,
                children: [
                  ...Global.Keybord.map(
                    (e) => GestureDetector(
                      onTap: () {
                        setState(() {
                          Global.Currancy += e.toString() as int;
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 25)
                            ]),
                        alignment: Alignment.center,
                        child: Text('$e',
                            style: GoogleFonts.lato(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff6C97FB),
                                letterSpacing: 1.5)),
                      ),
                    ),
                  ).toList(),
                  // GestureDetector(
                  //   onTap: () {
                  //     setState(() {
                  //       Global.Currancy +=.;
                  //     });
                  //   },
                  //   child: Container(
                  //     decoration: const BoxDecoration(
                  //       color: Colors.white,
                  //       boxShadow: [
                  //         BoxShadow(color: Colors.black12, blurRadius: 25),
                  //       ],
                  //     ),
                  //     alignment: Alignment.center,
                  //     child: Text('.',
                  //         style: GoogleFonts.lato(
                  //             fontSize: 25,
                  //             fontWeight: FontWeight.bold,
                  //             color: Color(0xff6C97FB),
                  //             letterSpacing: 1.5)),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Global.Currancy = 0;
                      });
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 25,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text("AC",
                          style: GoogleFonts.lato(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff6C97FB),
                              letterSpacing: 1.5)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 250,
              width: 380,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 35,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showMaterialModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) =>
                                  BottomSheetT0(),
                            );
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              margin: EdgeInsets.only(right: 5),
                              width: 30,
                              child:  Flag.fromString(
                                Global.to,
                                height: 10,
                                width: 100,
                                fit: BoxFit.fill,
                                replacement: Text('ACC not found'),
                              ),
                            ),
                            AutoSizeText("${Global.toName}",maxLines: 2,),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue.shade200),
                          color: Color(0xffEEF2FF),
                        ),
                        child: Text(
                          Global.Currancy.toString(),
                          style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff6C97FB),
                              letterSpacing: 1.5),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showMaterialModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => BottomSheetT0From(),
                            );
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              margin: EdgeInsets.only(right: 5),
                              width: 30,
                              child:  Flag.fromString(
                                Global.from,
                                height: 10,
                                width: 100,
                                fit: BoxFit.fill,
                                replacement: Text('ACC not found'),
                              ),
                            ),
                            AutoSizeText("${Global.fromName}",maxLines: 2,),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue.shade200),
                          color: Color(0xffEEF2FF),
                        ),
                        child: Text(
                          "${result}",
                          style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff6C97FB),
                              letterSpacing: 1.5),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                     setState(() {
                       getCityCurrency();
                     });
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "Convert",
                        style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
  getCityCurrency() async {
    var uri =
        'https://api.apilayer.com/exchangerates_data/convert?to=${Global.toName}&from=${Global.fromName}&amount=500&apikey=oG8nENxdrhft11OAMy5xkQbtkY8c4w9I';
    var url = Uri.parse(uri);
    var response = await http.get(url,headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      var decodeData = json.decode(response.body);
      setState(() {
        result = decodeData['result'];
      });
      print(decodeData);
    } else {
      print(response.statusCode);
    }
  }

  // updateUI(var decodedData) {
  //   setState(() {
  //     if (decodedData == null) {
  //       Result = 0;
  //
  //     } else {
  //       Result = decodedData['result'];
  //
  //     }
  //   });
  // }
}


class BottomSheetT0 extends StatefulWidget {
  const BottomSheetT0({Key? key}) : super(key: key);

  @override
  State<BottomSheetT0> createState() => _BottomSheetT0State();
}

class _BottomSheetT0State extends State<BottomSheetT0> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView  (
      controller: ModalScrollController.of(context),
      child: Container(
        height: h - 200,
        width: w,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                height: 8,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Text("Select Country",
                style: GoogleFonts.lato(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6C97FB),
                    letterSpacing: 1.5)),
            ...Global.Countrys.map((e) => GestureDetector(
              onTap: (){
                setState(() {
                  Global.to = e['flag'];
                  Global.toName = e['name'];
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => CurrencyPage()));
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      margin: EdgeInsets.only(right: 10),
                      width: 60,
                      child:  Flag.fromString(
                        '${e['flag']}',
                        height: 10,
                        width: 100,
                        fit: BoxFit.fill,
                        replacement: Text('ACC not found'),
                      ),
                    ),
                    Text(e['name'],style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                  ],
                ),
              ),
            ),
            ).toList()
          ],
        ),
      ),
    );
  }

}


class BottomSheetT0From extends StatefulWidget {
  const BottomSheetT0From({Key? key}) : super(key: key);

  @override
  State<BottomSheetT0From> createState() => _BottomSheetT0FromState();
}

class _BottomSheetT0FromState extends State<BottomSheetT0From> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView  (
      controller: ModalScrollController.of(context),
      child: Container(
        height: h - 200,
        width: w,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                height: 8,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Text("Select Country",
                style: GoogleFonts.lato(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6C97FB),
                    letterSpacing: 1.5)),
            ...Global.Countrys.map((e) => GestureDetector(
              onTap: (){
                setState(() {
                  Global.from = e['flag'];
                  Global.fromName = e['name'];
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => CurrencyPage()));
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      margin: EdgeInsets.only(right: 10),
                      width: 60,
                      child:  Flag.fromString(
                        '${e['flag']}',
                        height: 10,
                        width: 100,
                        fit: BoxFit.fill,
                        replacement: Text('ACC not found'),
                      ),
                    ),
                    Text(e['name'],style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                  ],
                ),
              ),
            ),
            ).toList()
          ],
        ),
      ),
    );
  }
}

