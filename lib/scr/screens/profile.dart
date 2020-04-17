import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[400],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.redAccent[400],
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
              color: Colors.redAccent[400],
              fontSize: 25,
              fontFamily: 'Libre Baskerville'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Faalih Ananda Mustika N.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'faalih@mail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.cobdoglaps.sa.edu.au/wp-content/uploads/2017/11/placeholder-profile-sq.jpg'),
                  radius: 50,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Card(
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
            child: ListTile(
              leading: Icon(Icons.email),
              title: Text('faalih@mail.com'),
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
            child: ListTile(
              leading: Icon(Icons.phone),
              title: Text('+62 878787779867'),
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
            child: ListTile(
              leading: Icon(Icons.location_city),
              title: Text('Jatinangor'),
            ),
          ),
        ],
      ),
    );
  }
}
