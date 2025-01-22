import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Scroll with Sliver',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test ScrollView'),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
              pinned: true,
              elevation: 200,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('SliverAppBar'),
                background: FlutterLogo(),
              ),
            ),

            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200, 
                crossAxisSpacing: 10, 
                mainAxisSpacing: 10,
                childAspectRatio: 4),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 9)],
                    child: Text('Grid Item $index', style: const TextStyle(fontSize: 20),),
                  );
                },
                childCount: 20,
              ),
            ),

            SliverFixedExtentList(
              itemExtent: 50,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 9)],
                    child: Text('List Item $index', style: const TextStyle(fontSize: 20),),
                  );
                },
              ),
            )
        ],
      ),
      
    );
  }
}

