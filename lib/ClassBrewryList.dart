import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:tasktest/DetailedPage.dart';
import 'package:tasktest/models/BreweryModel.dart';

import 'models/TodoModel.dart';


class ClassbrewryList extends StatefulWidget {
//  const Test({Key key}) : super(key: key);

  @override
  _ClassbrewryListState createState() => _ClassbrewryListState();
}

class _ClassbrewryListState extends State<ClassbrewryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
       child: Consumer<TodoModel>(
        builder: (context, snapshot, child) {
          if (snapshot == null) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 4.0,
                valueColor: AlwaysStoppedAnimation(Colors.green),
              ),
            );
          } else {
            return ListView.builder(
                padding: EdgeInsets.all(5),
                scrollDirection: Axis.vertical,
                itemCount: snapshot.brewerylist.length,
                itemBuilder: (context, index) {
                  print(snapshot.brewerylist[index]);
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>DetailedPage(index)));
                    },
                    child: Card(
                      margin: EdgeInsets.only(left:10,right: 10,top: 5,bottom: 5),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        // decoration: BoxDecoration(
                        //   color: Colors.white24,
                        //   border: new Border.all(
                        //     color: Colors.green,
                        //     width: 2.0,
                        //     style: BorderStyle.solid,
                        //
                        //   ),
                        //   borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                        //
                        // ),

                        child: Text("${snapshot.brewerylist[index].name}", textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight:FontWeight.bold ),),
                      ),
                    ),
                  );
                }
            );
          }
        }
      )
    ));






  }


  @override
  void initState() {
    getBrewryList();
  }

  getBrewryList() async {
    String url = 'https://api.openbrewerydb.org/breweries';
    Response response = await get(Uri.parse(url));
    print(response.body);
    var list =jsonDecode(response.body);
    List<Brewry> Blist=[];
    for(int i=0;i<list.length;i++){
      Map<String,dynamic> data=list[i];
      Brewry brewery= Brewry(id: data['id'], obdb_id: data['obdb_id'], name: data['name'], brewery_type: data['brewery_type'], address_2: data['address_2'].toString(), address_3: data['address_3'].toString(), city: data['city'], state: data['state'], county_province: data['county_province'].toString(), postal_code: data['postal_code'].toString(), country: data['country'].toString(), longitude: data['longitude'].toString(), latitude: data['latitude'].toString(), phone: data['phone'].toString(), website_url: data['website_url'].toString(), created_at: data['created_at'].toString(), updated_at: data['updated_at'].toString());
      Blist.add(brewery);
      print(Blist[i].name);
    }
    print(Blist.length);
   await Provider.of<TodoModel>(context, listen: false).setbrewrylist(Blist);
  }


}
