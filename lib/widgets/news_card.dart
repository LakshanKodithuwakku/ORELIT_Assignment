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
      width: width,
      height: 130,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.orange),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
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
            SizedBox(width: 10,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width - 180,
                    child: RichText(
                      overflow: TextOverflow.ellipsis,maxLines: 2,
                      strutStyle: StrutStyle(fontSize: 12.0),
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          text: 'want to limit the number of rows in the table, because I get about 40 rows from the API, and I need to make 5 rows. Tell me, what method should be applied'),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.black,
                        size: 18,
                      ),
                      SizedBox(width: 8,),
                      Text("author - " + author),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
