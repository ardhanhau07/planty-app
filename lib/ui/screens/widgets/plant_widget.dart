
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/plants.dart';
import 'package:page_transition/page_transition.dart';

import '../details_page.dart';

class PlantWidget extends StatelessWidget {
  const PlantWidget({
    
    Key? key,
    required this.index, required this.planList
  }) : super(key:key);

  final int index;
  final List<Plant> planList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> planList = Plant.plantList;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: DetailsPage(
                  plantId: planList[index].plantId,
                ),
                type: PageTransitionType.bottomToTop));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Constants.primaryColor.withOpacity(.1),
            borderRadius: BorderRadius.circular(10)),
        height: 80.0,
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      color:
                          Constants.primaryColor.withOpacity(.8),
                      shape: BoxShape.circle),
                ),
                Positioned(
                    bottom: 5,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 80.0,
                      child:
                          Image.asset(planList[index].imageURL),
                    )),
                Positioned(
                    bottom: 5,
                    left: 80,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(planList[index].category),
                        Text(planList[index].plantName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Constants.blackColor))
                      ],
                    ))
              ],
            ),
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                r'$' + planList[index].price.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Constants.primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
