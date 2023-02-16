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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    print("Lakshan");
    _news = await ScienceNewsApi.getScienceNews();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: backgroundYellow,
        child: Padding(
          padding: const EdgeInsets.only(top: 55.0),
          child: Column(
            children: [
              Text(
                "NEWS",style: TextStyle(
                color: backgroundWhite,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Science"),
                        Text("Here is your science news"),
                        SizedBox(height: 20,),
                        Container(
                          height: height - 222,
                          child: ListView.builder(
                              itemCount: _news.length,
                              itemBuilder: (context, index) {
                                return ListTile(horizontalTitleGap: 0,
                                    minVerticalPadding: 8,
                                    title: NewsCard(
                                        content: _news[index].content,
                                        author: _news[index].author,
                                        imageUrl:
                                        _news[index].imageUrl)
                                    );
                              }),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Science',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_outlined),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Technology',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: backgroundYellow,
        onTap: _onItemTapped,
      ),
    );
  }
}
