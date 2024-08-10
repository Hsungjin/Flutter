import 'package:flutter/material.dart';

void main() {
  runApp(const WantedClone());
}

class WantedClone extends StatelessWidget {
  const WantedClone({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WantedHome(),
    );
  }
}

class WantedHome extends StatefulWidget {
  const WantedHome({super.key});

  @override
  State<WantedHome> createState() => _WantedHomeState();
}

class _WantedHomeState extends State<WantedHome> {
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '채용',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 32,
            ),
            padding: EdgeInsets.zero,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              size: 32,
            ),
            padding: EdgeInsets.zero,
          ),
          ElevatedButton(
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                width: 30,
                height: 30,
              )),
          InkWell(
              onTap: () {},
              child: Container(
                color: Colors.amber,
                width: 30,
                height: 30,
              )),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade300))),
        child: BottomNavigationBar(
            currentIndex: index,
            onTap: (int index) {
              setState(() {
                this.index = index;
              });
            },
            selectedItemColor: Colors.blue,
            selectedIconTheme: IconThemeData(color: Colors.blue),
            selectedLabelStyle: TextStyle(color: Colors.blue),
            selectedFontSize: 14,
            iconSize: 14,
            unselectedItemColor: Colors.grey,
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            unselectedLabelStyle: TextStyle(color: Colors.grey),
            unselectedFontSize: 14,
            items: const [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.work_outlined),
                  ), label: '채용'),
              BottomNavigationBarItem(icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.diamond),
              ), label: '커리어'),
              BottomNavigationBarItem(icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.group),
              ), label: '소셜'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'MY 원티드'),
              BottomNavigationBarItem(icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.menu),
              ), label: '전체'),
            ]),
      ),
    );
  }
}
