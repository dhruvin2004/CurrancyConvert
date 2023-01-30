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

   String result = "";

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
                      DropdownButton(
                        value: Global.fromName,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: Global.Countrys.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            Global.fromName = newValue!;
                          });
                        },
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
                        child: TextFormField(
                          controller: Global.Amount,
                          onChanged: (val){
                            setState(() {
                              val = Global.Amount.text;
                            });
                          },
                          textAlign: TextAlign.end,
                          style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff6C97FB),
                              letterSpacing: 1.5),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownButton(
                        value: Global.toName,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: Global.Countrys.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            Global.toName = newValue!;
                          });
                        },
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
        'https://api.apilayer.com/exchangerates_data/convert?to=${Global.fromName}&from=${Global.toName}&amount=${Global.Amount.text}&apikey=oG8nENxdrhft11OAMy5xkQbtkY8c4w9I';
    var url = Uri.parse(uri);
    var response = await http.get(url,headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      var decodeData = json.decode(response.body);
      setState(() {
        result = decodeData['result'].toString();
      });
      print(decodeData);
    } else {
      print(response.statusCode);
    }
  }

}


