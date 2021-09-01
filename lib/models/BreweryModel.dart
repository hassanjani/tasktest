import 'package:flutter/cupertino.dart';

class Brewry{
  int id;
  String obdb_id;
  String name;
  String brewery_type;
  String address_2;
  String address_3;
  String city;
  String state;
  String county_province;
  String postal_code;
  String country;
  String longitude;
  String latitude;
  String phone;
  String website_url;
  String created_at;
  String updated_at;



  int get getid=>id;
  String get getobdb_id=>obdb_id;
  String get getname =>name;
  String get getbrewery_type=>brewery_type;
  String get getaddress_2=>address_2;
  String get getaddress_3=>address_3;
  String get getcity=>city;
  String get getstate=>state;
  String get getcounty_province=>country;
  String get getpostal_code=>postal_code;
  String get getcountry=>country;
  String get getlongitude=>longitude;
  String get getlatitude=>latitude;
  String get getphone=>phone;
  String get getwebsite_url=>website_url;
  String get getcreated_at=>created_at;
  String get getupdated_at=>updated_at;



  // String get getid => id;
  // String get getuserid => obdb_id;
  // String get getroom => name;
  // String get getpercent => brewery_type;
  // String get getmessagetext => messageText;
  // bool get getoptions => options;
  // String get gettime => time;
  // int get getCHECK => check;


  Brewry({
    required this.id,
    required this.obdb_id,
    required this.name,
    required this.brewery_type,
    required this.address_2,
    required this.address_3,
    required  this.city,
    required this.state,
    required this.county_province,
    required  this.postal_code,
    required  this.country,
    required this.longitude,
    required this.latitude,
    required this.phone,
    required this.website_url,
    required this.created_at,
    required this.updated_at
  });

}
