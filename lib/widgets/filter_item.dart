import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterItem extends StatelessWidget{
  FilterItem({required this.img, super.key});
  final img;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Image.asset(img)
                ),
              );
  }
}