import 'package:flutter/material.dart';
import 'package:toonapp/screens/home_screen.dart';
import 'package:toonapp/screens/webhome_screen.dart';
import 'package:toonapp/services/api_service.dart';

void main() {
  runApp(const App());
}

// class App extends StatelessWidget {
//   const App({super.key});

//   기본 구조 및 위젯 학습
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           elevation: 99,
//           title: Text("Hello Flutter!"),
//         ),
//         body: Center(
//           child: Text('Hello world!'),
//         ),
//       ),
//     );
//   }

//   기본적인 UI 그리는 방법 학습
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: const Color(0xFF181818),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         const Text(
//                           "Hey, Selena",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 28,
//                             fontWeight: FontWeight.w800,
//                           ),
//                         ),
//                         Text(
//                           "Welcome Back",
//                           style: TextStyle(
//                             color: Colors.white.withOpacity(0.8),
//                             fontSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Text(
//                   'Total Balance',
//                   style: TextStyle(
//                     fontSize: 22,
//                     color: Colors.white.withOpacity(0.8),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   '\$5 194 482',
//                   style: TextStyle(
//                     fontSize: 44,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Button(
//                         text: 'Transfer',
//                         bgColor: Color(0xFFF1B33B),
//                         textColor: Colors.black),
//                     Button(
//                         text: 'Request',
//                         bgColor: Color(0xFF1F2123),
//                         textColor: Colors.white),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       'Wallets',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 36,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Text(
//                       'View All',
//                       style: TextStyle(
//                         color: Colors.white.withOpacity(0.8),
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const CurrencyCard(
//                   name: 'Euro',
//                   code: 'EUR',
//                   amout: '6 428',
//                   icon: Icons.euro_rounded,
//                   isInverted: false,
//                 ),
//                 Transform.translate(
//                   offset: const Offset(0, -20),
//                   child: const CurrencyCard(
//                     name: 'Bitcoin',
//                     code: 'BTC',
//                     amout: '9 785',
//                     icon: Icons.currency_bitcoin,
//                     isInverted: true,
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: const Offset(0, -40),
//                   child: const CurrencyCard(
//                     name: 'Dollar',
//                     code: 'USD',
//                     amout: '425',
//                     icon: Icons.attach_money_rounded,
//                     isInverted: false,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// StattefulWideget 학습
// class App extends StatefulWidget {
//   const App({super.key});

//   @override
//   State<App> createState() => _AppState();
// }

// class _AppState extends State<App> {
//   int counter = 0;

//   bool showtitle = true;

//   List<int> numbers = [];

//   void onClicked() {
//     setState(() {
//       counter = counter + 1;
//     });
//   }

//   void resetClicked() {
//     setState(() {
//       numbers = [];
//       counter = 0;
//     });
//   }

//   void onClicked2() {
//     setState(() {
//       numbers.add(numbers.length);
//     });
//   }

//   void toggleTitle() {
//     setState(() {
//       showtitle = !showtitle;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         textTheme: const TextTheme(
//           titleLarge: TextStyle(
//             color: Colors.red,
//           ),
//         ),
//       ),
//       home: Scaffold(
//         backgroundColor: const Color(0xFFF4EDDB),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Click Count',
//                 style: TextStyle(
//                   fontSize: 30,
//                 ),
//               ),
//               Text('$counter'),
//               for (var n in numbers) Text('$n'),
//               showtitle ? const MyLargeTitle() : const Text('notinh'),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                       iconSize: 40,
//                       onPressed: onClicked,
//                       icon: const Icon(Icons.add_box_rounded)),
//                   IconButton(
//                       iconSize: 40,
//                       onPressed: onClicked2,
//                       icon: const Icon(Icons.list)),
//                   IconButton(
//                       iconSize: 40,
//                       onPressed: resetClicked,
//                       icon: const Icon(Icons.restore)),
//                   IconButton(
//                       iconSize: 40,
//                       onPressed: toggleTitle,
//                       icon: const Icon(Icons.remove_red_eye)),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyLargeTitle extends StatefulWidget {
//   const MyLargeTitle({
//     super.key,
//   });

//   @override
//   State<MyLargeTitle> createState() => _MyLargeTitleState();
// }

// class _MyLargeTitleState extends State<MyLargeTitle> {
//   bool showtitle = true;

//   @override
//   void initState() {
//     super.initState();
//     print('initState!');
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     print('dispose!');
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('build');
//     return Text(
//       'My Large Title',
//       style: TextStyle(
//           fontSize: 30, color: Theme.of(context).textTheme.titleLarge?.color),
//     );
//   }
// }

// 뽀모도로 타이머
// class App extends StatefulWidget {
//   const App({super.key});

//   @override
//   State<App> createState() => _AppState();
// }

// class _AppState extends State<App> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSwatch(
//           backgroundColor: const Color(0xFFE7626C),
//         ),
//         textTheme: const TextTheme(
//           displayLarge: TextStyle(
//             color: Color(0xFF232B55),
//           ),
//         ),
//         cardColor: const Color(0xFFF4EDDB),
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebHome(),
    );
  }
}
