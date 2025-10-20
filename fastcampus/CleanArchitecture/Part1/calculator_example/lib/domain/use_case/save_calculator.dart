import 'package:calculator_example/domain/domain.dart';
import 'package:calculator_example/util/util.dart';

class SaveCalculatorEntityUseCase
    implements IUseCase<void, SaveCalculatorParams> {
  final ICalculatorRepository _calculatorRepository;

  SaveCalculatorEntityUseCase(this._calculatorRepository);

  @override
  Future<void> execute([SaveCalculatorParams? params]) async {
    if (params == null) return;

    return _calculatorRepository.save(params.entity);
  }
}

class SaveCalculatorParams {
  final CalculatorEntity entity;

  SaveCalculatorParams({required this.entity});
}
