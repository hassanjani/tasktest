import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/TodoModel.dart';



class DetailedPage extends StatefulWidget {

  int index;
  DetailedPage(this.index);


 // const DetailedPage({Key? key}) : super(key: key);

  @override
  _DetailedPageState createState() => _DetailedPageState(index);
}

class _DetailedPageState extends State<DetailedPage> {
  int index;
 _DetailedPageState(this.index);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(

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

                          return Card(
                            margin: EdgeInsets.only(left:10,right: 10,top: 5,bottom: 5),
                            child: Container(
                              height: MediaQuery.of(context).size.height/2,
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                border: new Border.all(
                                  color: Colors.green,
                                  width: 2.0,
                                  style: BorderStyle.solid,

                                ),
                                borderRadius: new BorderRadius.all(new Radius.circular(20.0)),

                              ),

                              child: Column(
                                children: [
                                  Text("${snapshot.brewerylist[index].name}", textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight:FontWeight.bold ),),
                                SizedBox(
                                  height: 5,

                                ), Text("${snapshot.brewerylist[index].city}", textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight:FontWeight.bold ),),
                                SizedBox(
                                  height: 5,

                                ), Text("${snapshot.brewerylist[index].phone}", textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight:FontWeight.bold ),),
                                SizedBox(
                                  height: 5,

                                ), Text("${snapshot.brewerylist[index].website_url}", textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight:FontWeight.bold ),),
                                SizedBox(
                                  height: 5,

                                ), Text("${snapshot.brewerylist[index].created_at}", textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight:FontWeight.bold ),),
                                SizedBox(
                                  height: 5,

                                ), Text("${snapshot.brewerylist[index].name}", textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight:FontWeight.bold ),),
                                SizedBox(
                                  height: 5,

                                ),

                                ],
                              ),
                            ),
                          );
                        }}
                    )
            )



        ),
      );

  }
}
