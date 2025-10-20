import 'package:calculator_example/domain/domain.dart';
import 'package:calculator_example/util/util.dart';

class FetchCalculatorEntityUseCase implements IUseCase<CalculatorEntity, void> {
  final ICalculatorRepository _calculatorRepository;

  FetchCalculatorEntityUseCase(this._calculatorRepository);

  @override
  Future<CalculatorEntity> execute([void params]) async {
    return _calculatorRepository.fetch();
  }
}
