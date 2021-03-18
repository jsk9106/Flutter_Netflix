import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/netflix.png'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Son',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 140,
              height: 5,
              color: Colors.red,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Linkify(
                onOpen: (link) async {
                  if(await canLaunch(link.url)) {
                    await launch(link.url);
                  }
                },
                text: 'http://whistle4u.com',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                linkStyle: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              color: Colors.red,
              padding: EdgeInsets.all(2),
              child: FlatButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit, color: Colors.white),
                    SizedBox(width: 10),
                    Text('프로필 수정하기', style: TextStyle(color: Colors.white))
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
