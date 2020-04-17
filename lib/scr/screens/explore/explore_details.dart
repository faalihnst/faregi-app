import 'package:flutter/material.dart';
import 'package:faregi_app/scr/models/city.dart';
import 'package:faregi_app/scr/widgets/afford_tours.dart';
import 'package:faregi_app/scr/widgets/todo_card.dart';

class ExploreDetails extends StatelessWidget {
  final City city;

  ExploreDetails(this.city);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.asset(
                    'images/${city.image}',
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: '${city.city} \n',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                          TextSpan(text: city.desc)
                        ],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey)),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, top: 20, bottom: 20),
                  child: Container(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: city.toDo.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return ToDoCard(
                          toDo: city.toDo[index],
                          name: city.toDo[index].name,
                          price: city.toDo[index].ticketPrice,
                          picture: city.toDo[index].images,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 20,
            left: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
          )
        ],
      ),
    );
  }
}
