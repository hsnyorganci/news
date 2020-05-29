import 'dart:async';
import 'dart:convert'; //it allows us to convert our json to a list

import 'package:cardd/model/newsModel.dart';
//import 'package:cardd/model/postModel.dart';
import 'package:cardd/widgets/CustomCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluent_appbar/fluent_appbar.dart';
import 'constants.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColor: AppColors.greenNotTransparent,
      ),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String dataMessage = "";

  List<News> data = List<News>();

  final ScrollController scrollController = ScrollController();

  //this async func will get data from the internet
  //when our func is done we return a string
  Future<bool> getData() async {
    //we have to wait to get the data so we use 'await'
    http.Response response = await http.get(
        //Uri.encodeFull removes all the dashes or extra characters present in our Uri
        Uri.encodeFull(
            "http://newsapi.org/v2/top-headlines?country=tr&category=health&apiKey=bdabbe44247944fba614776fb0846a98"),
        headers: {
          //if your api require key then pass your key here as well e.g "key": "my-long-key"
          "Accept": "application/json"
        });

    Map<String, dynamic> news = json.decode(response.body);
    News n = News.fromJson(news);

    setState(() {
      data.add(n);
    });

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        listDemo(),
        FluentAppBar(
          appBarColor: AppColors.green,
          scrollController: scrollController,
          titleText: 'Sağlıktaki Gelişmeler',
          titleColor: AppColors.black,
        ),
      ]),
    );
  }

  Widget listDemo() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: data.first.articles.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              //widget.animationController.forward();
              return Container(
                //height: 80,
                //color: Colors.amber[colorCodes[index]],
                child: Center(
                  child: CustomCard(data: data.first.articles.elementAt(index)),
                ),
              );
            },
          );
        }
      },
    );
  }
}
