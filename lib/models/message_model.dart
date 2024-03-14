import 'package:chat_app/constants.dart';
// here we create medel for datat from internet

class MessageModel {
  final String message;
  final String id;
  MessageModel(this.message, this.id);

//here we create factory constructor to recieve json data;
  factory MessageModel.fromJson(jsonData) {
    return MessageModel(jsonData[kMessage], jsonData[kId]);
  }
}
