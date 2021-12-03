import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tasktest/UIScreens/Screen3.dart';
import 'package:tasktest/models/Products.dart';
import 'package:tasktest/models/TodoModel.dart';

//
// class DotsIndicator extends AnimatedWidget {
//   DotsIndicator({
//     required this.controller,
//     required this.itemCount,
//     required this.onPageSelected,
//     this.color: Colors.white,
//   }) : super(listenable: controller);
//
//   /// The PageController that this DotsIndicator is representing.
//   final PageController controller;
//
//   /// The number of items managed by the PageController
//   final int itemCount;
//
//   /// Called when a dot is tapped
//   final ValueChanged<int> onPageSelected;
//
//   /// The color of the dots.
//   ///
//   /// Defaults to `Colors.white`.
//   final Color color;
//
//   // The base size of the dots
//   static const double _kDotSize = 8.0;
//
//   // The increase in the size of the selected dot
//   static const double _kMaxZoom = 2.0;
//
//   // The distance between the center of each dot
//   static const double _kDotSpacing = 25.0;
//
//   Widget _buildDot(int index) {
//     double selectedness = Curves.easeOut.transform(
//       max(
//         0.0,
//         1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
//       ),
//     );
//     double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
//     return new Container(
//       width: _kDotSpacing,
//       child: new Center(
//         child: new Material(
//           color: color,
//           type: MaterialType.circle,
//           child: new Container(
//             width: _kDotSize * zoom,
//             height: _kDotSize * zoom,
//             child: new InkWell(
//               onTap: () => onPageSelected(index),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget build(BuildContext context) {
//     print("here");
//     return new Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: new List<Widget>.generate(itemCount, _buildDot),
//     );
//   }
// }


class DetailsPage extends StatefulWidget {
  @override
  State createState() => new DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {


  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;


  final _kArrowColor = Colors.black.withOpacity(0.8);
  final List<Widget> _pages = <Widget>[
   P1(),
    Screen3(),
    Scaffold(
      body: Container(),
    ),


  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new IconTheme(
        data: new IconThemeData(color: _kArrowColor),
        child: new Stack(
            children: <Widget>[
        new PageView.builder(

        physics: new AlwaysScrollableScrollPhysics(),
        controller: _controller,
        reverse: false,
        allowImplicitScrolling: false,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return _pages[index % _pages.length];
        },
      ),
      new Positioned(
        bottom: 0.0,
        left: 0.0,
        right: 0.0,
        child: new Container(
         // color: Colors.grey[800]!.withOpacity(0.5),
          padding: const EdgeInsets.all(20.0),
          child: new Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,

              onDotClicked: (int page) {
                _controller.animateToPage(
                  page,
                  duration: _kDuration,
                  curve: _kCurve,
                );
              },
              effect: CustomizableEffect(
                dotDecoration:  DotDecoration(
                  width: 30,
                  height: 2,
                  color: Colors.black54
                ), activeDotDecoration: DotDecoration(
                  width: 35,
                  height: 3,
                color: Colors.orangeAccent
              ),

                // dotHeight: 16,
                // dotWidth: 16,
                // type: WormType.thin,
                // strokeWidth: 5,
              ),

              // new DotsIndicator(
              //   controller: _controller,
              //   itemCount: 3,
              //   onPageSelected: (int page) {
              //     _controller.animateToPage(
              //       page,
              //       duration: _kDuration,
              //       curve: _kCurve,
              //     );
              //   },
              // ),
            ),
          ),
        ),),
        ],
      ),
    ),);
  }
}


class P1 extends StatefulWidget {
 // const P1({Key? key}) : super(key: key);

  @override
  _P1State createState() => _P1State();
}

class _P1State extends State<P1> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Consumer<TodoModel>(
          builder: (context, value, child) {
            if(value.selectedproduct==null){
             return Center(
                child: CircularProgressIndicator(),
              );

            }else{
             return Container(
               margin: EdgeInsets.all(10),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(
                       color: Colors.white,
                       height: MediaQuery.of(context).size.height*0.70,
                       padding: EdgeInsets.only(left: 20,right: 20,top: 60,bottom: 40),
                       child: CachedNetworkImage(
                        imageUrl: value.selectedproduct!.image,
                         fit: BoxFit.fill,
                       ),
                     ),
                     SizedBox(
                       height: 10,
                     ),
                     Text("${value.selectedproduct!.price}",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                     SizedBox(
                       height: 8,
                     ),
                     Text("${value.selectedproduct!.title} ",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.orange)),
                     SizedBox(
                       height: 8,
                     ),
                     Text("${value.selectedproduct!.description}", maxLines: 3,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 18 )),
                     SizedBox(
                       height: 10,
                     ),
                     Container(
                       child: Center(
                         child: Card(
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(15.0),
                           ),
                           color: Colors.orangeAccent,
                           elevation: 2,
                           child: Container(
                             padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                               child: Text(" Add to job", style: TextStyle(color: Colors.white,fontSize: 20),)),
                         ),
                       ),
                     )
                   ],
                 )
             );
            }
          },
        )
      ),
    );
  }



}

