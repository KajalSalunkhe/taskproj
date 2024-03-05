import 'package:flutter/material.dart';

class TopTitles extends StatelessWidget {
  final String title;
  final String subTitle;
  const TopTitles({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            subTitle,
            style: TextStyle(fontSize: 18),
          ),
          
        ],
      ),
    );
  }
}
