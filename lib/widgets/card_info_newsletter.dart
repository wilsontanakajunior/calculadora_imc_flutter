import 'package:calculadora_imc/models/info_newsletter_model.dart';
import 'package:calculadora_imc/pages/card_detail_newletter_page.dart';
import 'package:flutter/material.dart';

class CardIndoNewletter extends StatefulWidget {
  const CardIndoNewletter({
    super.key,
    required this.infoNewsLetterModel,
  });

  final InfoNewsLetterModel infoNewsLetterModel;

  @override
  State<CardIndoNewletter> createState() => _CardIndoNewletterState();
}

class _CardIndoNewletterState extends State<CardIndoNewletter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 10),
      height: 200,
      child: Card(
        elevation: 3,
        child: ListTile(
          title: Row(
            children: [
              Image.asset(
                widget.infoNewsLetterModel.imgUrl,
                height: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.infoNewsLetterModel.msgTitle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          subtitle: Container(
            padding: const EdgeInsets.only(top: 10),
            margin: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  textAlign: TextAlign.justify,
                  widget.infoNewsLetterModel.msgBody,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CardDetailNewletterPage(
                              infoNewsLetterModel: widget.infoNewsLetterModel,
                            );
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "Ler mais...",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
