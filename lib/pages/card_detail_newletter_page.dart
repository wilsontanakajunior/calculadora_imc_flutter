import 'package:calculadora_imc/models/info_newsletter_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CardDetailNewletterPage extends StatelessWidget {
  const CardDetailNewletterPage({
    super.key,
    required this.infoNewsLetterModel,
  });

  final InfoNewsLetterModel infoNewsLetterModel;

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: false,
      tag: infoNewsLetterModel.id,
      child: SafeArea(
        maintainBottomViewPadding: true,
        child: Scaffold(
          body: Card(
            elevation: 0,
            shadowColor: Colors.grey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        infoNewsLetterModel.imgUrl,
                        height: 100,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    infoNewsLetterModel.msgTitle,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Text(
                      infoNewsLetterModel.msgBody,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 14.5,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InAppWebView(
                      initialUrlRequest: URLRequest(
                        url: Uri.parse(
                            'https://www.youtube.com/watch?v=S7ES9GVIG3U'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
