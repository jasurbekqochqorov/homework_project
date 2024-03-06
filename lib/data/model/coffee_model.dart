
class CoffeeModel{
  final int categoryId;
  final String name;
  final String description;
  final String subtitle;
  final double rate;
  final double price;
  final Type type;

  CoffeeModel({
    required this.price,
    required this.description,
    required this.name,
    required this.categoryId,
    required this.rate,
    required this.subtitle,
    required this.type
});
  
}