import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapbox_search_flutter/mapbox_search_flutter.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  GoogleMapController? _controller;
  bool boolcheck = false;
  List<Marker> markers = [];
  LatLng? searchplace, pickup, dropup;

  static final CameraPosition initialLocation = CameraPosition(
    //target: LatLng(37.42796133580664, -122.085749655962),
    target: LatLng(34.76794253432019, 72.35988692832102),
    zoom: 16.4746,
  );

  @override
  Widget build(BuildContext context) {
    print("here");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        automaticallyImplyLeading: false,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu),
            Text(
              'Jobs',
              style: TextStyle(color: Colors.white),
            ),

            Icon(Icons.search)
          ],
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   ),
            SizedBox(height: 10,),
            Text(
              "Location",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.80,
              margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                child: Stack(
                  children: [
                    GoogleMap(
                      mapToolbarEnabled: true,
                      mapType: MapType.normal,
                      initialCameraPosition: initialLocation,
                      zoomControlsEnabled: false,
                      markers: Set.of(markers),
                      onMapCreated: (GoogleMapController controller) {
                        _controller = controller;
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.70,
                            child: MapBoxPlaceSearchWidget(
                              popOnSelect: false,
                              apiKey:
                                  "pk.eyJ1Ijoib3p6aTAwMzIiLCJhIjoiY2tzeWFmNTEyMDVsODJubW9zanE3aThqYiJ9.mJvOAw4gojuJjDWFJPIfIQ",
                              height: 300,
                              searchHint: 'Search for place',
                              onSelected: (place) {
                                print(place.geometry.coordinates[0]);
                                print(place.geometry.coordinates[1]);
                                print(place.placeName);
                                searchplace = LatLng(
                                    place.geometry.coordinates[1],
                                    place.geometry.coordinates[0]);
                                addmarker(searchplace!);
                              },
                              context: context,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Text("    "),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 20,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.80,
                            child: MapBoxPlaceSearchWidget(
                              popOnSelect: false,
                              apiKey:
                                  "pk.eyJ1Ijoib3p6aTAwMzIiLCJhIjoiY2tzeWFmNTEyMDVsODJubW9zanE3aThqYiJ9.mJvOAw4gojuJjDWFJPIfIQ",
                              height: 300,
                              searchHint: 'Pickup  Location',
                              onSelected: (place) {
                                print(place.geometry.coordinates[0]);
                                print(place.geometry.coordinates[1]);
                                print(place.placeName);
                                pickup = LatLng(place.geometry.coordinates[1],
                                    place.geometry.coordinates[0]);
                                addmarker(pickup!);
                              },
                              context: context,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.80,
                            child: MapBoxPlaceSearchWidget(
                              popOnSelect: false,
                              apiKey:
                                  "pk.eyJ1Ijoib3p6aTAwMzIiLCJhIjoiY2tzeWFmNTEyMDVsODJubW9zanE3aThqYiJ9.mJvOAw4gojuJjDWFJPIfIQ",
                              height: 300,
                              searchHint: 'Drop-Off Location',
                              onSelected: (place) {
                                print(place.geometry.coordinates[0]);
                                print(place.geometry.coordinates[1]);
                                print(place.placeName);
                                dropup = LatLng(place.geometry.coordinates[1],
                                    place.geometry.coordinates[0]);
                                addmarker(dropup!);
                              },
                              context: context,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addmarker(LatLng latLng) {
    _controller!.animateCamera(CameraUpdate.newCameraPosition(
        new CameraPosition(bearing: 0, target: latLng, tilt: 0, zoom: 15.00)));
    markers.add(Marker(
      markerId: MarkerId("s"),
      position: latLng,
      draggable: false,
      zIndex: 2,
      flat: true,
      anchor: Offset(0.5, 0.5),
      icon: BitmapDescriptor.defaultMarker,
      onTap: () {
      },
    ));
    setState(() {
      markers;
    });
  }
}
