import 'package:calculadora_imc/models/info_newsletter_model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CardDetailNewletterPage extends StatefulWidget {
  const CardDetailNewletterPage({
    super.key,
    required this.infoNewsLetterModel,
  });

  final InfoNewsLetterModel infoNewsLetterModel;

  @override
  State<CardDetailNewletterPage> createState() =>
      _CardDetailNewletterPageState();
}

class _CardDetailNewletterPageState extends State<CardDetailNewletterPage> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    // Substitua 'YOUTUBE_VIDEO_ID' pelo ID do vídeo do YouTube que você deseja reproduzir
    _controller = YoutubePlayerController(
      initialVideoId: widget.infoNewsLetterModel.videoId,
      flags: const YoutubePlayerFlags(
        showLiveFullscreenButton: false,
        autoPlay: true,
        mute: false,
        controlsVisibleAtStart: false,
        hideControls: true,
        forceHD: true,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: false,
      tag: widget.infoNewsLetterModel.id,
      child: SafeArea(
        maintainBottomViewPadding: true,
        child: Scaffold(
          body: Card(
            elevation: 0,
            shadowColor: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
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
                        widget.infoNewsLetterModel.imgUrl,
                        height: 100,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.infoNewsLetterModel.msgTitle,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      widget.infoNewsLetterModel.msgBody,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 14.5,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.red,
                      onReady: () {
                        // Executa alguma ação quando o player estiver pronto
                        print('Player pronto');
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40,
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
