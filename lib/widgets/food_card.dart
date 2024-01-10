import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class FoodCard extends StatelessWidget {
  FoodCard(
      {required this.name,
      required this.discount,
      required this.ratings,
      required this.imgurl,
      super.key});
  final name;
  final discount;
  final ratings;
  final imgurl;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          // onSelectMeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(
                // "https://theoptimiz.com/restro/public/Resturants/chaayos.png"
                "$imgurl",
              ),
              fit: BoxFit.cover,
              height: 220,
              width: double.infinity,
            ),
            Positioned(
              left: 330,
              top: 125,
              child: Container(
                height: 25,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Color.fromRGBO(27, 196, 0, 1)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "$ratings",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -2,
              left: 0,
              right: 0,
              child: Container(
                color: Color.fromARGB(255, 255, 255, 255),
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis, // Very long text ...
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    // const SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/Discount.png"),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "$discount% FLAT OFF",
                          style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 255, 40, 24),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),

                        // MealItemTrait(
                        //   icon: Icons.schedule,
                        //   label: '${meal.duration} min',
                        // ),
                        // const SizedBox(width: 12),
                        // MealItemTrait(
                        //   icon: Icons.work,
                        //   label: complexityText,
                        // ),
                        // const SizedBox(width: 12),
                        // MealItemTrait(
                        //   icon: Icons.attach_money,
                        //   label: affordabilityText,
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
