import 'package:calculadora_imc/models/info_newsletter_model.dart';
import 'package:calculadora_imc/respositories/card_info_newsletter.dart';
import 'package:calculadora_imc/widgets/card_info_newsletter.dart';
import 'package:calculadora_imc/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget {
  DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  List<InfoNewsLetterModel>? infoNewsLetterModel = <InfoNewsLetterModel>[];
  bool _idDisposed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _idDisposed = true;
    super.dispose();
  }

  void carregarDados() async {
    infoNewsLetterModel = await CardInfoNewlettersRepositories.get();
    if (!_idDisposed) {
      setState(() {});
    }
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
            "Imc",
            style: TextStyle(color: Colors.white),
          ),
        ),
        drawer: CustomDrawer(),
        body: infoNewsLetterModel == null
            ? const LinearProgressIndicator()
            : Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: infoNewsLetterModel!.length,
                  itemBuilder: (context, index) {
                    return CardIndoNewletter(
                        infoNewsLetterModel: infoNewsLetterModel![index]);
                  },
                ),
              ),
      ),
    );
  }
}
