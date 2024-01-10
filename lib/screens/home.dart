import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:meals/widgets/filter_item.dart';
import 'package:meals/widgets/food_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  var add = "Click on Icon to get Location";
  var name1 = "Restaurant Name";
  var discount1 = 0;
  var ratings1 = 4.5;
  var imgUrl1 = "https://theoptimiz.com/restro/public/Resturants/chaayos.png";
  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lng = locationData.longitude;

    if (lat == null || lng == null) {
      return;
    }

    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyA7NoRDS7S6jnZeJrgQedhJQnwOJXJ07AM");
    final response = await http.get(url);
    final resData = json.decode(response.body);
    // final address = resData['results'][0]['formatted_address'];
    final address =
        "${resData['results'][0]['address_components'][0]['long_name']}, ${resData['results'][0]['address_components'][1]['long_name']}";
    setState(() {
      add = address;
    });

    final url1 =
        Uri.parse("https://theoptimiz.com/restro/public/api/get_resturants");

    final response2 = await http.post(
        Uri.parse("https://theoptimiz.com/restro/public/api/get_resturants"),
        body: {"lat": lat.toString(), "lng": lng.toString()});

    final resData2 = json.decode(response2.body);
    print(resData2['data'][0]['rating']);
    print(resData2['data'][0]['name']);
    print(resData2['data'][0]['primary_image']);
    setState(() {
      name1 = resData2['data'][0]['name'];
      discount1 = resData2['data'][0]['discount'];
      ratings1 = resData2['data'][0]['rating'];
      imgUrl1 = resData2['data'][0]['primary_image'];
    });

    //  final response3 = await http.post(
    //       Uri.parse("https://theoptimiz.com/restro/public/api/get_resturants"),
    //       body: {"lat": (lat+0.3).toString(), "lng": (lng+0.4).toString()});

    //   final resData3 = json.decode(response2.body);
  }

  @override
  Widget build(BuildContext context) {
    // String add = "Alpha 1, Greater Noida";
    // TODO: implement build
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.location_on),
                  onPressed: () {
                    _getCurrentLocation();
                  }),
              Text(
                add,
                style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 39, 39, 39),
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        // SizedBox(
        //   height: 30,
        // ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Text(
                    "All",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(width: 12,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 241, 57, 57),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    children: [
                      Image.asset('assets/pizza.png'),
                      Text(
                        " Pizza",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 12,),
              FilterItem(img: "assets/roasted-chicken.png"),
              SizedBox(width: 12,),
              FilterItem(img: "assets/salad.png"),
              SizedBox(width: 12,),
              FilterItem(img: "assets/burger.png"),

            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: SearchBar(
            leading: Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
              weight: 30,
            ),
            hintText: "Search Food Items",
            hintStyle: MaterialStatePropertyAll(
              GoogleFonts.poppins(
                color: const Color.fromARGB(255, 201, 200, 200),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            "Nearby Restaurants",
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FoodCard(
                    name: name1,
                    discount: discount1,
                    imgurl: imgUrl1,
                    ratings: ratings1),
                FoodCard(
                    name: name1,
                    discount: discount1,
                    imgurl: imgUrl1,
                    ratings: ratings1),
                FoodCard(
                    name: name1,
                    discount: discount1,
                    imgurl: imgUrl1,
                    ratings: ratings1),
                FoodCard(
                    name: name1,
                    discount: discount1,
                    imgurl: imgUrl1,
                    ratings: ratings1),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
