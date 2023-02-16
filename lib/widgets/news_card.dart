import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String content;
  final String author;
  final String imageUrl;
  NewsCard({
    required this.content,
    required this.author,
    required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 130,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.orange),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.indigoAccent,
                  ),
                ),
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Content"),
                Row(
                  children: [
                    Icon(
                      Icons.schedule,
                      color: Colors.black,
                      size: 18,
                    ),
                    Text("author - " + author),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
