import 'package:flutter/material.dart';

class FavoritesContainer extends StatelessWidget {
  const FavoritesContainer({Key? key, required this.name,  this.lastName = ''}) : super(key: key);
  final String name;
  final String lastName;

  @override
  Widget build(BuildContext context) {

    double _w = MediaQuery.of(context).size.width;

    return Container(

      margin: EdgeInsets.only(right: 24),

      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xff113D6B),
            child: Text('${name[0].toUpperCase()}${lastName.isEmpty ? '' : lastName[0].toUpperCase()}'),
            radius: 30,
          ),

          SizedBox(height: _w / 35,),

          Text(
            '$name\n$lastName',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400
            ),
          )
        ],
      ),
    );
  }
}
