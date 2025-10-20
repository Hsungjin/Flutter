import "package:calculator_example/data/data.dart";
import "package:calculator_example/data/source/local/calculator.dart";
import "package:calculator_example/domain/domain.dart";
import "package:flutter/foundation.dart";

class CalculatorEntityViewModel extends ValueNotifier<CalculatorEntity> {
  final FetchCalculatorEntityUseCase _fetchCalculatorEntityUseCase;
  final SaveCalculatorEntityUseCase _saveCalculatorEntityUseCase;

  CalculatorEntityViewModel(
    this._fetchCalculatorEntityUseCase,
    this._saveCalculatorEntityUseCase,
    super.calculatorEntity,
  );

  Future<void> load() async {
    value = await _fetchCalculatorEntityUseCase.execute();
  }

  Future<void> save() async {
    final SaveCalculatorParams params = SaveCalculatorParams(entity: value);
    await _saveCalculatorEntityUseCase.execute(params);
  }

  void calculate(String buttonText) {
    value.calculate(buttonText);
    notifyListeners();
  }
}


