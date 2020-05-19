import 'package:cardd/model/postModel.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key key,
    @required this.data,
  }) : super(key: key);

  final PostModel data;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        16,
      ),
      elevation: 3,
      child: Row(
        children: <Widget>[
          Column(
            
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*0.1,
                child: Text(
                  data.id != null ? data.id.toString() : "",
                ),
              ),
            ],
          ),

          Column(
            children: <Widget>[
              Container(
                                width: MediaQuery.of(context).size.width*0.8,
                child: Text(
                  data.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                child: Text(

                  data.body,
                  style: TextStyle(
                    
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
