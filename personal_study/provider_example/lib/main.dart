import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/fish_model.dart';
import 'package:provider_example/seafish_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FishModel(name: 'Salmon', number: 10, size: 'big')),
        ChangeNotifierProvider(create: (context) => SeafishModel(name: "Tuna", tunaNumber: 0, size: 'middle'))
      ],
      child: MaterialApp(
        home: FishOrder(),
      ),
    );
  }
}

class FishOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fish Order'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Fish name: ${Provider.of<FishModel>(context).name}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            High(),
          ],
        ),
      ),
    );
  }
}

class High extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Spicy A is located at high place', style: TextStyle(fontSize: 16),),
        SizedBox(height: 20,),
        SpicyA(),
      ],
    );
  }
}

class SpicyA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Fish number: ${Provider.of<FishModel>(context).number}', style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
        Text('Fish size: ${Provider.of<FishModel>(context).size}', style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),
        Middle(),
      ],
    );
  }
}

class Middle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Spicy B is located at middle place', style: TextStyle(fontSize: 16),),
        SizedBox(height: 20,),
        SpicyB(),
      ],
    );
  }
}

class SpicyB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Tuna number: ${Provider.of<SeafishModel>(context).tunaNumber}', style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
        Text('Tuna size: ${Provider.of<SeafishModel>(context).size}', style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: () {
          Provider.of<SeafishModel>(context, listen: false).changeSeafishNumber();
        }, child: Text('Change sea fish number ${Provider.of<SeafishModel>(context).tunaNumber}')),
        Low(),
      ],
    );
  }
}

class Low extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Spicy C is located at low place', style: TextStyle(fontSize: 16),),
        SizedBox(height: 20,),
        SpicyC(),
      ],
    );
  }
}

class SpicyC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Fish number: ${Provider.of<FishModel>(context).number}', style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
        Text('Fish size: ${Provider.of<FishModel>(context).size}', style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: () {
          Provider.of<FishModel>(context, listen: false).changeFishNumber();
        }, child: Text('Change fish number ${Provider.of<FishModel>(context).number}'))
      ],
    );
  }
}
