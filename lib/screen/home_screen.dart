import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix/model/model_movie.dart';
import 'package:flutter_netflix/widget/box_slider.dart';
import 'package:flutter_netflix/widget/carousel_slider.dart';
import 'package:flutter_netflix/widget/circle_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> streamData;
  @override
  void initState() {
    super.initState();
    streamData = firestore.collection('movie').snapshots();
  }
  
  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('movie').snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) return LinearProgressIndicator();
        return _buildBody(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Movie> movies = snapshot.map((d) => Movie.fromSnapshot(d)).toList();
    return ListView(
      children: [
        Stack(
          children: [
            CarouselImage(movies: movies),
            TopBar(),
          ],
        ),
        CircleSlider(movies: movies),
        BoxSlider(movies: movies),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }
}


class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "images/netflix.png",
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'TV ????????????',
              style: TextStyle(fontSize: 14),
            ),
          ),Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '??????',
              style: TextStyle(fontSize: 14),
            ),
          ),Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '?????? ?????? ?????????',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
