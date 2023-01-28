import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'global.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
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
              decoration: BoxDecoration(
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
                          Global.Currancy += e.toString();
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
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 25),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text('.',
                        style: GoogleFonts.lato(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6C97FB),
                            letterSpacing: 1.5)),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Global.Currancy = "";
                      });
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 25),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text("AC",
                          style: GoogleFonts.lato(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff6C97FB),
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
                boxShadow: [
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
                      Text("INDIA"),
                      Container(
                        height: 50,
                        width: 250,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue.shade200),
                          color: Color(0xffEEF2FF),
                        ),
                        child: Text("${Global.Currancy}",
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff6C97FB),
                                letterSpacing: 1.5),),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("INDIA"),
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue.shade200),
                          color: Color(0xffEEF2FF),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    child: Container(
                      height: 40,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text("Convert",style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5),),
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
}
