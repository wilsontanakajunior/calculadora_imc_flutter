import 'package:calculadora_imc/models/imc_model.dart';
import 'package:calculadora_imc/respositories/imc_repository.dart';
import 'package:calculadora_imc/respositories/imc_sqlite_repository.dart';
import 'package:calculadora_imc/widgets/card_result_imc.dart';
import 'package:calculadora_imc/widgets/form_imc.dart';
import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key, required this.imcRepository});

  final ImcRepository imcRepository;
  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  ImcSQLiteRepository imcSQLiteRepository = ImcSQLiteRepository();
  

  List<ImcModel> _imcs = <ImcModel>[];
  bool _carregando = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterImcs();
  }

  void obterImcs() async {
    _carregando = true;
    setState(() {});
    _imcs = await widget.imcRepository.listarImcs();
    _carregando = false;
    setState(() {});
  }

  void atualizarImcs() {
    setState(() {
      obterImcs();
    });
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
                return FomrImc(
                  onImcAdded: atualizarImcs,
                );
              },
            );
            setState(() {});
          },
          child: const Icon(
            Icons.add_box,
          ),
        ),
        body: _carregando
            ? const LinearProgressIndicator()
            : _imcs.isEmpty
                ? const SizedBox(
                    child: Center(
                      child: Text(
                        "Nenhuma pesagem registrada!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 15,
                    ),
                    child: ListView.builder(
                      itemCount: _imcs.length,
                      itemBuilder: (context, index) {
                        return CardResulImc(imcs: _imcs[index]);
                      },
                    ),
                  ),
      ),
    );
  }
}
