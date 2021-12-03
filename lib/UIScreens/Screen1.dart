import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasktest/UIScreens/PageViewScreen2.dart';
import 'package:tasktest/models/TodoModel.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  void initState() {
    // TODO: implement initState
    initialize();
    super.initState();
  }

  initialize() {
    if (Provider.of<TodoModel>(context, listen: false).Filtered_ProductList ==
        null) {
      Provider.of<TodoModel>(context, listen: false).getProducts();
    } else {}
  }

  TabController? tabController;

  //int _selectedIndex =0;

//  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            automaticallyImplyLeading: false,
            bottom: TabBar(
              indicatorColor: Colors.transparent,
              controller: tabController,
              onTap: (value) {
                Provider.of<S_index>(context, listen: false).onchange(value);
                print(value);
                if (value == 0) {
                  Provider.of<TodoModel>(context, listen: false)
                      .onchange("All");
                } else if (value == 1) {
                  Provider.of<TodoModel>(context, listen: false)
                      .onchange("men's clothing");
                } else {
                  Provider.of<TodoModel>(context, listen: false)
                      .onchange("jewelery");
                }
              },
              tabs: [
                Tab(
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, right: 20, left: 20),
                    decoration: BoxDecoration(
                      color:
                          Provider.of<S_index>(context, listen: true).s_index ==
                                  0
                              ? Colors.orangeAccent
                              : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Text(
                      "All",
                      style: TextStyle(
                          color: Provider.of<S_index>(context, listen: true)
                                      .s_index ==
                                  0
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, right: 10, left: 10),
                    decoration: BoxDecoration(
                      color:
                          Provider.of<S_index>(context, listen: true).s_index ==
                                  1
                              ? Colors.orangeAccent
                              : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Text(
                      "Electronics",
                      style: TextStyle(
                          color: Provider.of<S_index>(context, listen: true)
                                      .s_index ==
                                  1
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, right: 10, left: 10),
                    decoration: BoxDecoration(
                      color:
                          Provider.of<S_index>(context, listen: true).s_index ==
                                  2
                              ? Colors.orangeAccent
                              : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Text(
                      "Jwellery",
                      style: TextStyle(
                          color: Provider.of<S_index>(context, listen: true)
                                      .s_index ==
                                  2
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            title: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Listings',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 120,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.search),
                )
              ],
            )),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    color: Colors.white,
                    child: Consumer<TodoModel>(
                      builder: (context, value, child) {
                        if (value.Filtered_ProductList == null) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                            itemCount: value.Filtered_ProductList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){
                                  Provider.of<TodoModel>(
                                      context,
                                      listen: false)
                                      .changeSProduct(value
                                      .Filtered_ProductList![
                                  index]);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailsPage()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  // decoration: BoxDecoration(
                                  //     color: Colors.white,
                                  //     borderRadius: BorderRadius.all(Radius.circular(15))
                                  // ),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    color: Colors.white,
                                    elevation: 3,
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: IntrinsicHeight(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl: value
                                                  .Filtered_ProductList![index]
                                                  .image,
                                              height: 70,
                                              width: 70,
                                            ),
                                            VerticalDivider(
                                              thickness: 1,
                                              color: Colors.grey,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.5,
                                                    child: Text(
                                                      value
                                                          .Filtered_ProductList![
                                                              index]
                                                          .title,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  value
                                                      .Filtered_ProductList![
                                                          index]
                                                      .price
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.orange),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        top: 8,
                                                        bottom: 8,
                                                        right: 12,
                                                        left: 12),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.orangeAccent,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  25)),
                                                    ),
                                                    child: Text("Add to Job")),
                                              ],
                                            ),
                                            Container(
                                              child:
                                                  Icon(Icons.arrow_forward_ios),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        "Top Machinery",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                  Container(
                    height: 210,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        );
                      },
                    ),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        "Lorem ipsum",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                  Container(
                    height: 210,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class S_index extends ChangeNotifier {
  int s_index = 0;

  onchange(int value) {
    s_index = value;
    notifyListeners();
  }
}
