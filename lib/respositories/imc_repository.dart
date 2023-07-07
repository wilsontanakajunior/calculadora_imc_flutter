import 'package:calculadora_imc/models/imc_model.dart';

class ImcRepository {
  final List<ImcModel> _imcs = [];

  Future<void> adicionarNovoImc({required ImcModel imcModel}) async {
    var now = DateTime.now();
    var result = imcModel.peso! / (imcModel.altura! * imcModel.altura!);
    result = double.tryParse(result.toStringAsFixed(2))!;
    _imcs.add(imcModel.copyWith(dataPesagem: now, resultadoImc: result));
  }

  Future<List<ImcModel>> listarImcs() async {
    await Future.delayed(const Duration(seconds: 1));
    return _imcs;
  }
}
