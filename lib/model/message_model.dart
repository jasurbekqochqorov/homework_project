class MessageModel {
  final String userId;
  final int messageId;
  final String messageText;
  final bool isFile;
  final String createdTime;
  final int contactId;
  final bool status;
  final String who;

  MessageModel({
    required this.who,
    required this.userId,
    required this.createdTime,
    required this.messageText,
    required this.messageId,
    required this.isFile,
    required this.contactId,
    required this.status,
  });

  factory MessageModel.fromJson(Map<String,dynamic> json){
    return MessageModel(
      who: json['who'] as String? ?? "",
      userId:json['user_id'] as String? ?? "",
      createdTime: json["createdTime"] as String? ?? "",
      messageText: json["createdTime"] as String? ?? "",
      messageId: json["messageId"] as int? ?? 0,
      isFile: json["isFile"] as bool? ?? false,
      contactId: json["contactId"] as int? ?? 0,
      status: json["status"] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id":'',
      "who":who,
      "createdTime": createdTime,
      "messageText": messageText,
      "messageId": messageId,
      "isFile": isFile,
      "contactId": contactId,
      "status": status
    };
  }
}

