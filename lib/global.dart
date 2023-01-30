import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Global
{
  static List Keybord= [
    7,8,9,4,5,6,1,2,3,0
  ];



  static int Currancy = 0;
  static String convert = "";

  static String to = "IN";
  static String from = "US";
  static String toName = "INR";
  static String fromName = "USD";

  static int amount = 0;

  static List Countrys = [
    {
      'flag' : "IN",
      'name' : "INR",
    },
    {
      'flag' : "US",
      'name' : "USD",
    },
    {
      'flag' : "DE",
      'name' : "DEU",
    },{
      'flag' : "JP",
      'name' : "JPN",
    },{
      'flag' : "KR",
      'name' : "KOR",
    },
  ];
}