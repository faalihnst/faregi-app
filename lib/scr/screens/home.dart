import 'package:flutter/material.dart';
import 'package:faregi_app/scr/constant.dart';
import 'package:faregi_app/scr/screens/authentication/auth_screen.dart';
import 'package:faregi_app/scr/screens/bookmark.dart';
import 'package:faregi_app/scr/screens/planner/budget_planner.dart';
import 'package:faregi_app/scr/screens/explore/explore_index.dart';
import 'package:faregi_app/scr/screens/hotel/hotel_book.dart';
import 'package:faregi_app/scr/screens/plane/plane_book.dart';
import 'package:faregi_app/scr/screens/things_to_do/thingstodo_index.dart';
import 'package:faregi_app/scr/screens/welcome.dart';
import 'package:faregi_app/scr/widgets/afford_tours.dart';
import 'package:faregi_app/scr/widgets/explores.dart';
import 'package:faregi_app/scr/widgets/icon_card.dart';
import 'profile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:faregi_app/scr/screens/train/train_book.dart';
import 'ui_helper.dart';
import 'car/car_book.dart';
import 'package:faregi_app/core/services/auth_service.dart';
import 'packages/packages_list.dart';
import 'package:faregi_app/core/locators.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService _authService = locator<AuthService>();
  String sessionId;
  String username;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    getCookie();
    super.initState();
  }

  void getCookie() async {
    sessionId = await _authService.sessionId;
    username = await _authService.currentUser.username;
  }

  List<Image> images = [
    Image(
      image: AssetImage('images/a.jpg'),
      fit: BoxFit.fill,
    ),
    Image(
      image: AssetImage('images/b.jpeg'),
      fit: BoxFit.fill,
    ),
    Image(
      image: AssetImage('images/c.jpg'),
      fit: BoxFit.fill,
    ),
    Image(image: AssetImage('images/d.jpg'), fit: BoxFit.fill),
    Image(
      image: AssetImage('images/e.jpeg'),
      fit: BoxFit.cover,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    UIHelper.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'fare.gi',
          style: TextStyle(
              color: Colors.redAccent[400],
              fontSize: 25,
              fontFamily: 'Libre Baskerville'),
        ),
        backgroundColor: Colors.white,
        leading: FlatButton(
          child: Image(
            image: AssetImage('images/fare.gi.png'),
          ),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        actions: <Widget>[
          FlatButton(
            child: Icon(
              Icons.person_outline,
              size: 25.0,
              color: Colors.redAccent[400],
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Profile()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Settings'),
              trailing: Icon(Icons.settings),
            ),
            (sessionId != null)
                ? ListTile(
                    title: Text('Bookmarks'),
                    trailing: Icon(Icons.person_outline),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Bookmarks()));
                    },
                  )
                : ListTile(
                    title: Text('Login'),
                    trailing: Icon(Icons.person_outline),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => AuthScreen()));
                    },
                  ),
            ListTile(
              title: Text('Logout'),
              trailing: Icon(Icons.close),
              onTap: () async {
                setState(() async {
                  await _authService.logout();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Welcome()));
                });
              },
            ),
            ListTile(
              title: Text('Close'),
              trailing: Icon(Icons.close),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            CarouselSlider(
              height: 160.0,
              items: images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red[400])),
                      child: Image(
                        image: i.image,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconCard(
                  iconData: Icons.date_range,
                  text: 'Planner',
                  pressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => BudgetPlanner()));
                  },
                  stateColor: kInActiveColor,
                ),
                IconCard(
                  iconData: Icons.directions_run,
                  text: 'Things to Do',
                  pressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ThingsToDo()));
                  },
                  stateColor: kInActiveColor,
                ),
                IconCard(
                  iconData: Icons.explore,
                  text: 'Explore',
                  pressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Explore()));
                  },
                  stateColor: kInActiveColor,
                ),
                IconCard(
                  iconData: Icons.card_travel,
                  text: 'Packages',
                  pressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Packages()));
                  },
                  stateColor: kInActiveColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconCard(
                  iconData: Icons.flight,
                  text: 'Flights',
                  stateColor: kInActiveColor,
                  pressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PlaneBook()));
                  },
                ),
                IconCard(
                  iconData: Icons.directions_railway,
                  text: 'Trains',
                  stateColor: kInActiveColor,
                  pressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => TrainBook()));
                  },
                ),
                IconCard(
                    iconData: Icons.directions_car,
                    text: 'Car Rentals',
                    pressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => CarBook()));
                    },
                    stateColor: kInActiveColor),
                IconCard(
                    iconData: Icons.location_city,
                    text: 'Hotels',
                    pressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HotelBook()));
                    },
                    stateColor: kInActiveColor),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Affordables Tours',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(child: Container(child: AffordTours())),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Explore',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(child: Explores()),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
