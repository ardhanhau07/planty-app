import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';
import 'package:plantapp/models/plants.dart';

class DetailsPage extends StatefulWidget {
  final int plantId;
  const DetailsPage({Key? key, required this.plantId}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool toggleIsFavorated(bool isFavorated) {
    return !isFavorated;
  }

  // Toggle add remove from chart
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _planList = Plant.plantList;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        border: Border(),
                        color: Constants.primaryColor.withOpacity(.15),
                      ),
                      child: Icon(
                        Icons.close,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint('favorite');
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border(),
                          color: Constants.primaryColor.withOpacity(.15),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              bool isFavorated = toggleIsFavorated(
                                  _planList[widget.plantId].isFavorated);
                              _planList[widget.plantId].isFavorated =
                                  isFavorated;
                            });
                          },
                          icon: Icon(
                            _planList[widget.plantId].isFavorated == true
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Constants.primaryColor,
                          ),
                        )),
                  ),
                ],
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
                height: size.height * .5,
                width: size.width,
                decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.4),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _planList[widget.plantId].plantName,
                              style: TextStyle(
                                color: Constants.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              r'$' + _planList[widget.plantId].price.toString(),
                              style: TextStyle(
                                  color: Constants.blackColor,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              _planList[widget.plantId].rating.toString(),
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Constants.primaryColor,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              size: 30.0,
                              color: Constants.primaryColor,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Expanded(
                        child: Text(
                      _planList[widget.plantId].decription,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 18,
                        color: Constants.blackColor.withOpacity(.7),
                      ),
                    ))
                  ],
                ),
              )),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                      top: 10,
                      left: 0,
                      child: SizedBox(
                        height: 350,
                        child: Image.asset(_planList[widget.plantId].imageURL),
                      )),
                  Positioned(
                      top: 10,
                      right: 0,
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PlantFeature(
                              title: 'Size',
                              plantFeature: _planList[widget.plantId].size,
                            ),
                            PlantFeature(
                              title: 'Humidity',
                              plantFeature:
                                  _planList[widget.plantId].humidity.toString(),
                            ),
                            PlantFeature(
                                title: 'Temperature',
                                plantFeature:
                                    _planList[widget.plantId].temperature),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * .9,
        height: 50,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    bool isSelected = toggleIsSelected(
                      _planList[widget.plantId].isSelected);
                      _planList[widget.plantId].isSelected = isSelected;
                  });
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: _planList[widget.plantId].isSelected == true ? Colors.white : Constants.primaryColor,
                ),
              ),
              decoration: BoxDecoration(
                  color: _planList[widget.plantId].isSelected == true ? Constants.primaryColor.withOpacity(.5) : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Constants.primaryColor.withOpacity(.3))
                  ]),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 1),
                          blurRadius: 5,
                          color: Constants.primaryColor.withOpacity(.3))
                    ]),
                child: const Center(
                  child: Text(
                    'BUY NOW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;
  const PlantFeature({
    Key? key,
    required this.plantFeature,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Constants.blackColor),
        ),
        Text(
          title,
          style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
