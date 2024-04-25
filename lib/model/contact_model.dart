import '../utils/icons/icon.dart';

class ContactModel{
  String image;
  String name;

  ContactModel({
    required this.name,
    required this.image
});
}

List<ContactModel> contacts= [
  ContactModel(name:"ALi", image:AppImages.fon),
  ContactModel(name:"Sardor", image:AppImages.fon),
  ContactModel(name:"Sarvar", image:AppImages.fon),
  ContactModel(name:"Komil", image:AppImages.fon),
  ContactModel(name:"Kamol", image:AppImages.fon),
  ContactModel(name:"Abul", image:AppImages.fon),
  ContactModel(name:"Abdushukr", image:AppImages.fon),
  ContactModel(name:"Jasur", image:AppImages.fon),
  ContactModel(name:"Qobil", image:AppImages.fon),
  ContactModel(name:"Qosimjon", image:AppImages.fon),
  ContactModel(name:"Abdulla", image:AppImages.fon),
];
