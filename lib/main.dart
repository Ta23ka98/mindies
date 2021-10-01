import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'content_list/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomeRanking extends StatefulWidget {
  const HomeRanking({Key? key}) : super(key: key);

  @override
  _HomeRankingState createState() => _HomeRankingState();
}

class _HomeRankingState extends State<HomeRanking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 2),
          Container(
            height: 138,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.blue),
                  ),
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Tag1"),
                      Icon(CupertinoIcons.question_circle, color: Colors.black),
                      Text("Tag2"),
                      Icon(CupertinoIcons.question_circle, color: Colors.black),
                      Text("Tag3"),
                      Icon(CupertinoIcons.exclamationmark_square,
                          color: Colors.blue),
                      Icon(Icons.lightbulb, color: Colors.yellow)
                    ],
                  ),
                ),
                ListTile(
                  leading: Text("1"),
                  title: Text("a"),
                ),
                Container(
                  height: 40,
                  color: Colors.blue[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.thumb_up, color: Colors.blue),
                      Text("55"),
                      Icon(Icons.thumb_down, color: Colors.blue),
                      Text("3"),
                      Icon(Icons.comment),
                      Text("55"),
                      Icon(Icons.bookmark, color: Colors.blue),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key? key, required String title}) : super(key: key);

  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  int _currentIndex = 0;
  final _pageWidgets = [
    PageWidget(color: Colors.white, title: 'Home'),
    PageWidget(color: Colors.white, title: 'Search'),
    PageWidget(color: Colors.white, title: 'Favorites'),
    PageWidget(color: Colors.white, title: 'Notifications'),
  ];

  void _onItemTapped(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Indies Miner"),
      ),
      body: _pageWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _currentIndex,
        onTap: (value) {
          // Respond to item press.
          _onItemTapped(value);
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            title: Text('Search'),
            icon: Icon(Icons.search),
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            title: Text('Favorites'),
            icon: Icon(Icons.favorite),
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            title: Text('Notifications'),
            icon: Icon(Icons.notifications),
            backgroundColor: Colors.blueAccent,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // ドキュメント作成
          await FirebaseFirestore.instance
              .collection('content') // コレクションID
              .doc('id_abc') // ドキュメントID
              .set({'name': '鈴木', 'age': 40}); // データ
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }
}

class PageWidget extends StatelessWidget {
  final Color color;
  final String title;

  PageWidget({Key? key, required this.color, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
