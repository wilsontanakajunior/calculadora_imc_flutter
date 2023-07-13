import 'package:calculadora_imc/models/imc_model.dart';
import 'package:calculadora_imc/respositories/sqlite/database.dart';

class ImcSQLiteRepository {
  Future<List<ImcModel>> obterImcs() async {
    var db = await SQLiteDataBase().obterDataBase();
    ImcModel imcModel = ImcModel();
    List<ImcModel> pesagens = [];
    var result = await db.rawQuery("SELECT * FROM pesagens");
    for (var element in result) {
      var pesagem = imcModel.copyWith(
        id: int.parse(element['id'].toString()),
        peso: double.parse(element['peso'].toString()),
        altura: double.parse(element['altura'].toString()),
        dataPesagem: DateTime.parse(element['dataPesagem'].toString()),
        resultadoImc: double.parse(element['resultadoImc'].toString()),
      );
      pesagens.add(pesagem);
    }
    return pesagens;
  }

  Future<void> salvar(ImcModel imcModel) async {
    var db = await SQLiteDataBase.iniciarBancoDeDados();
    await db.rawInsert(
      'INSERT INTO pesagens (peso, altura, dataPesagem, resultadoImc) value(?,?,?,?)',
      [
        imcModel.peso,
        imcModel.altura,
        imcModel.dataPesagem,
        imcModel.resultadoImc,
      ],
    );
  }
  // static final List<ImcModel> _imcs = [];

  // Future<void> adicionarNovoImc({required ImcModel imcModel}) async {
  //   var now = DateTime.now();
  //   var result = imcModel.peso! / (imcModel.altura! * imcModel.altura!);
  //   result = double.tryParse(result.toStringAsFixed(2))!;
  //   _imcs.add(imcModel.copyWith(dataPesagem: now, resultadoImc: result));
  // }

  // Future<List<ImcModel>> listarImcs() async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   return List<ImcModel>.from(_imcs);
  // }
}
