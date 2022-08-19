import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui_app/models/activity_model.dart';
import 'package:travel_ui_app/models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  DestinationScreen({required this.destination});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Widget _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Hero(
                      tag: widget.destination.imageUrl!,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                        child: Image.asset(
                          widget.destination.imageUrl!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: IconButton(
                            splashRadius: 25,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Container(
                              margin: EdgeInsets.all(8),
                              child: IconButton(
                                splashRadius: 25,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: Container(
                              margin: EdgeInsets.all(8),
                              child: IconButton(
                                splashRadius: 25,
                                onPressed: () {},
                                icon: Icon(
                                  FontAwesomeIcons.sort,
                                  size: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Positioned(
                    left: 20,
                    bottom: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.destination.city!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.locationArrow,
                              size: 15,
                              color: Colors.white70,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.destination.country!,
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 20,
                    child: Icon(
                      Icons.location_on,
                      color: Colors.white70,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10, bottom: 15),
                itemBuilder: (context, index) {
                  Activity activity = widget.destination.activities![index];
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(100, 20, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 120,
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      activity.name!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '\$${activity.price!}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22,
                                        ),
                                      ),
                                      Text(
                                        'per pax',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                activity.type!,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              _buildRatingStars(activity.rating!),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        activity.startTimes![0],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        activity.startTimes![1],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 15,
                        bottom: 15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            activity.imageUrl!,
                            width: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  );
                },
                itemCount: widget.destination.activities!.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
