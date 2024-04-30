class ContactModel {
  final String userId;
  final int contactId;
  final String contactName;
  final String contactLasName;

  ContactModel({
    required this.userId,
    required this.contactId,
    required this.contactLasName,
    required this.contactName,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      userId: json["userId"] as String? ?? "",
      contactId: json["contactId"] as int? ?? 0,
      contactLasName: json['contactLasName'] as String? ?? "",
      contactName: json['contactName'] as String? ?? "",
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'userId':'',
      "contactName":contactName,
      "contactId":contactId,
      "contactLasName":contactLasName,
    };
  }
}

// List<ContactModel> allContacts = [
//   ContactModel(
//     userId: "",
//     contactId: 1,
//     contactLasName: "Qosimjon",
//     contactName: "Qodirov",
//     isOnline: true,
//     imageUrl:AppImages.fon,
//     lastOnlineTime: DateTime.now(),
//   ),
//   ContactModel(
//     contactId: 2,
//     contactLasName: "Abdushkr",
//     contactName: "Asrolov",
//     isOnline: true,
//     imageUrl:AppImages.fon,
//     lastOnlineTime: DateTime.now(),
//   ),
//
//   ContactModel(
//     contactId: 3,
//     contactLasName: "Alisher",
//     contactName: "Urinov",
//     isOnline: true,
//     imageUrl:AppImages.fon,
//     lastOnlineTime: DateTime.now(),
//   ),
//
//   ContactModel(
//     contactId: 4,
//     contactLasName: "Abul",
//     contactName: "Qochqorov",
//     isOnline: true,
//     imageUrl:AppImages.fon,
//     lastOnlineTime: DateTime.now(),
//   )
// ];
