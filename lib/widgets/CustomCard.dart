import 'package:cardd/model/newsModel.dart';
import 'package:cardd/pages/newsdetail.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key key,
    @required this.data,
  }) : super(key: key);

  final Articles data;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.height;

    return Card(
      margin: EdgeInsets.fromLTRB(
        0,
        0,
        0,
        0,
      ),
      elevation: 3,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => NewsDetail(
                  url: data.url == null
                      ? "https://marvelapp.com/asdf"
                      : data.url),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(
            0,
            8,
            0,
            8,
          ),
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(
                      8,
                      8,
                      8,
                      8,
                    ),
                    //width: MediaQuery.of(context).size.width * 0.2,

                    // Haber Görseli
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: data.urlToImage == null
                          ? Image.asset(
                              'assets/images/news.png',
                              width: screenWidth * 0.3,
                            )
                          : Image.network(
                              data.urlToImage,
                              width: screenWidth * 0.3,
                            ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,

                    // Haber Başlığı
                    child: Text(
                      data.title == null ? "":data.title ,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      8,
                      0,
                      0,
                    ),
                    width: MediaQuery.of(context).size.width * 0.6,

                    // Haber Detayı
                    child: Text(
                      data.description == null ? "" : data.description,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
