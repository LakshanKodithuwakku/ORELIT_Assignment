import 'package:flutter/material.dart';
import 'package:orelit_assignment/constants/colors.dart';
import 'package:orelit_assignment/models/news.dart';
import 'package:orelit_assignment/models/science.api.dart';
import 'package:orelit_assignment/widgets/news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late List<NewsModel> _news;
  bool _isLoading = true;
  String newsType = "science";

  void _onItemTapped(int index) async {
    _isLoading = true;
    switch (index) {
      case 0:
        newsType = "science";
        break;
      case 1:
        newsType = "technology";
        break;
      case 2:
        newsType = "business";
        break;
    }
    setState(() {
      _selectedIndex = index;
    });
    await getNews(newsType);
    _isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    getNews(newsType);
  }

  Future<void> getNews(String newsType) async {
    _news = await ScienceNewsApi.getScienceNews(newsType);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundYellow,
        child: Padding(
          padding: const EdgeInsets.only(top: 55.0),
          child: Column(
            children: [
              Text(
                "NEWS",
                style: TextStyle(
                  color: backgroundWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  newsType[0].toUpperCase() +
                                      newsType.substring(1).toLowerCase(),
                                  style: TextStyle(
                                    color: textBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Here is your " + newsType + " news",
                                  style: TextStyle(
                                      color: textGray,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          ),
                          _isLoading
                              ? Expanded(
                                child: Center(
                                  child: Container(
                                      height: 30,
                                      width: 30,
                                      child: CircularProgressIndicator()),
                                ),
                              )
                              : Expanded(
                                child: Container(
                                    child: ListView.builder(
                                        itemCount: _news.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                              horizontalTitleGap: 0,
                                              minVerticalPadding: 8,
                                              title: NewsCard(
                                                  content: _news[index].content,
                                                  author: _news[index].author,
                                                  imageUrl: _news[index].imageUrl));
                                        }),
                                  ),
                              ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black, blurRadius: 3, offset: Offset(0.0, 0.75)),
          ],
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Science',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account_outlined),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'Technology',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: backgroundYellow,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
