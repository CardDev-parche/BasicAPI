import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Knowkedge"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(
          builder: (context, snapshot) {
            var data =
                json.decode(snapshot.data.toString()); //[{MOBA},{},{},...]
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return myBox(data[index]['title'], data[index]['subtitle'],
                    data[index]['image_url'],data[index]['detail']);
              },
              itemCount: data.length,
            );
          },
          future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
        ),
      ),
    );
  }

  Widget myBox(String title, String subtitle, String imageURL, String detail) {
    var v1 = title;
    var v2 = subtitle;
    var v3 = imageURL;
    var v4 = detail;

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      //color: Colors.blue[50],
      height: 180,
      decoration: BoxDecoration(
          //color: Colors.blue[50],

          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(imageURL),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.darken))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 25,
                color: Colors.white70,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 15, color: Colors.white70),
          ),
          SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {
              print("Next Page >>>");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailPage(v1,v2,v3,v4)));
            },
            child: Text("Read More ->"),
          )
        ],
      ),
    );
  }
}
