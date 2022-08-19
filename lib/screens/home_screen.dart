import 'package:flutter/material.dart';
import 'package:travel_ui_app/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui_app/models/hotel_model.dart';
import 'package:travel_ui_app/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.personBiking,
  ];

  Widget _buildIcon(int index) {
    final Color color1 = Color(0xFFE7EBEE);
    final Color color2 = Theme.of(context).colorScheme.secondary;
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: _selectedIndex == index
          ? Theme.of(context).colorScheme.secondary
          : Color(0xFFE7EBEE),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        splashColor: color1,
        highlightColor: color2,
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            // color: _selectedIndex == index
            //     ? Theme.of(context).colorScheme.secondary
            //     : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(
            _icons[index],
            size: 25,
            color: _selectedIndex == index
                ? Theme.of(context).primaryColor
                : Color(0xFFB4C1C4),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(vertical: 30),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 120),
            child: Text(
              'What would you like to found?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons
                .asMap()
                .entries
                .map((MapEntry map) => _buildIcon(map.key))
                .toList(),
          ),
          _selectedIndex == 0
              ? Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      _DestinationCarousel(),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: _HotelCarousel(),
                      ),
                    ],
                  ),
                )
              : _selectedIndex == 1
                  ? Center(
                      heightFactor: 15,
                      child: Text(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        'Bed Screen',
                      ),
                    )
                  : _selectedIndex == 2
                      ? Center(
                          heightFactor: 15,
                          child: Text(
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                            'Walk Screen',
                          ),
                        )
                      : Center(
                          heightFactor: 15,
                          child: Text(
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                            'Bik Screen',
                          ),
                        ),
        ],
      ),
    );
  }
}

class _DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Destinations',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              Material(
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300,
          child: ListView.builder(
            itemCount: destinations.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Destination destination = destinations[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DestinationScreen(destination: destination);
                      },
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 210,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        bottom: 15,
                        child: Container(
                          height: 120,
                          width: 200,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 6),
                                blurRadius: 6,
                                color: Colors.black12,
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${destination.activities!.length} activities',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                Text(
                                  destination.description!,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Hero(
                              tag: destination.imageUrl!,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  image: AssetImage(destination.imageUrl!),
                                  height: 180,
                                  width: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              bottom: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    destination.city!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.locationArrow,
                                        size: 10,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        destination.country!,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class _HotelCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Exclusive Hotels',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              Material(
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300,
          child: ListView.builder(
            itemCount: hotels.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Hotel hotel = hotels[index];
              return Container(
                margin: EdgeInsets.all(10),
                width: 240,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      bottom: 15,
                      child: Container(
                        height: 120,
                        width: 240,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 6),
                              blurRadius: 6,
                              color: Colors.black12,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                hotel.name!,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                hotel.address!,
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                '\$${hotel.price!} / night',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: AssetImage(hotel.imageUrl!),
                          height: 180,
                          width: 220,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
