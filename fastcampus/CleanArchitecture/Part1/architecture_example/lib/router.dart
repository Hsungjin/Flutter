import 'package:architecture_example/clean_architecture/ui/ui.dart';
import 'package:architecture_example/home_screen.dart';
import 'package:architecture_example/mvc/controller.dart';
import 'package:architecture_example/mvc/model.dart';
import 'package:architecture_example/mvc/view.dart';
import 'package:architecture_example/mvvm/view.dart';
import 'package:architecture_example/mvvm/view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:architecture_example/mvvm/model.dart' as mvvm_model;
import 'package:architecture_example/clean_architecture/domain/domain.dart'
    as clean_architecture_domain;
import 'package:architecture_example/clean_architecture/presentation/presentation.dart'
    as clean_architecture_presentation;

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/mvc',
      builder: (context, state) => MvcView(
        counterController: CounterController(CounterModel()),
        counterModeController: CounterModeController(CounterModeModel()),
      ),
    ),
    GoRoute(
      path: '/mvvm',
      builder: (context, state) => MvvmView(
        counterViewModel: CounterViewModel(mvvm_model.CounterModel()),
        counterModeViewModel: CounterModeViewModel(
          mvvm_model.CounterModeModel(),
        ),
      ),
    ),
    GoRoute(
      path: '/clean-architecture',
      builder: (context, state) => CleanArchitectureView(
        counterViewModel: clean_architecture_presentation.CounterViewModel(
          clean_architecture_domain.CounterModel(),
        ),
        counterModeViewModel:
            clean_architecture_presentation.CounterModeViewModel(
              clean_architecture_domain.CounterModeModel(),
            ),
      ),
    ),
  ],
);
