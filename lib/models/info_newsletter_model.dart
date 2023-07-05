import 'package:flutter/material.dart';

class InfoNewsLetterModel {
  String id = UniqueKey().toString();
  String imgUrl;
  String videoId;
  String msgTitle;
  String msgBody;

  InfoNewsLetterModel({
    required this.imgUrl,
    required this.videoId,
    required this.msgTitle,
    required this.msgBody,
  });
}
