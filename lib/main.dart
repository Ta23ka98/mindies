import 'package:flutter/material.dart';

void main() {
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final _pageWidgets = [
    PageWidget(color:Colors.white, title:'Home'),
    PageWidget(color:Colors.white, title:'Search'),
    PageWidget(color:Colors.white, title:'Favorites'),
    PageWidget(color:Colors.white, title:'Notifications'),
  ];
  void _onItemTapped(int index) => setState(() => _currentIndex = index );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Any'),
                Tab(text: 'Genre'),
                Tab(text: 'Place'),
          ]),
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
    ),
    );
  }
}







class PageWidget extends StatelessWidget {
  final Color color;
  final String title;
  PageWidget({Key? key, required this.color, required this.title}) : super(key: key);
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
