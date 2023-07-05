import 'package:flutter/material.dart';

class InfoNewsLetterModel {
  String id = UniqueKey().toString();
  String imgUrl;
  String msgTitle;
  String msgBody;

  InfoNewsLetterModel({
    required this.imgUrl,
    required this.msgTitle,
    required this.msgBody,
  });
}
