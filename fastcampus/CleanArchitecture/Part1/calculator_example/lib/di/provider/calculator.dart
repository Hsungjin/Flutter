import 'package:calculator_example/data/data.dart';
import 'package:calculator_example/domain/entity/entity.dart';
import 'package:calculator_example/domain/repository/repository.dart';
import 'package:calculator_example/domain/use_case/use_case.dart';
import 'package:calculator_example/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorProvider extends StatelessWidget {
  final Widget child;

  const CalculatorProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ICalculatorLocalDataSource>(
          create: (context) => CalculatorLocalDataSource(),
        ),
      ],
      child: MultiProvider(
        providers: [
          Provider<CalculatorDataSource>(
            create: (context) => CalculatorDataSource(context.read()),
          ),
        ],
        child: MultiProvider(
          providers: [
            Provider<ICalculatorRepository>(
              create: (context) => CalculatorRepository(context.read()),
            ),
          ],
          child: MultiProvider(
            providers: [
              Provider<FetchCalculatorEntityUseCase>(
                create: (context) =>
                    FetchCalculatorEntityUseCase(context.read()),
              ),
              Provider<SaveCalculatorEntityUseCase>(
                create: (context) =>
                    SaveCalculatorEntityUseCase(context.read()),
              ),
            ],
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider<CalculatorEntityViewModel>(
                  create: (context) => CalculatorEntityViewModel(
                    context.read(),
                    context.read(),
                    CalculatorEntity(),
                  ),
                ),
              ],
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
