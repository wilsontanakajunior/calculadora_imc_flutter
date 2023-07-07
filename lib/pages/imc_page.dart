import 'package:calculadora_imc/models/imc_model.dart';
import 'package:calculadora_imc/respositories/imc_repository.dart';
import 'package:calculadora_imc/widgets/form_imc.dart';
import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  ImcRepository imcRespository = ImcRepository();
  List<ImcModel> _imcs = <ImcModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterImcs();
  }

  void obterImcs() async {
    _imcs = await imcRespository.listarImcs();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green.shade800.withOpacity(0.9),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 30,
            weight: 40,
            fill: 0.5,
            shadows: [
              Shadow(
                color: Colors.green.shade900,
                offset: const Offset(0, 2),
              )
            ],
          ),
          backgroundColor: Colors.green,
          title: const Text(
            "Calculadora de Imc",
            style: TextStyle(color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return FomrImc();
              },
            );
            setState(() {});
          },
          child: const Icon(
            Icons.add_box,
          ),
        ),
        body: _imcs.length < 1
            ? CircularProgressIndicator()
            : Container(
                child: Text("${_imcs[0].resultadoImc}"),
              ),
      ),
    );
  }
}
