import 'package:app_life_cycle/page/app_life_cycle_listener.dart';
import 'package:app_life_cycle/page/widget_binding_observer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(),
    ),
    GoRoute(
      path: '/widgetsBindingObserver',
      builder: (context, state) => const WidgetBindingObserver(),
    ),
    GoRoute(
      path: '/appLifecycleListener',
      builder: (context, state) => const AppLifeCycleListener(),
    ),
  ],
);



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => context.push('/widgetsBindingObserver'),
              child: Container(
                padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.teal,
                  ),
                  child: const Text("Go to WidgetsBindingObserver")),
            ),

            const SizedBox(height: 10,),

            InkWell(
              onTap: () => context.push('/appLifecycleListener'),
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: const Text("Go to AppLifecycleListener")),
            )
          ],
        ),
      ),
    );
  }
}
