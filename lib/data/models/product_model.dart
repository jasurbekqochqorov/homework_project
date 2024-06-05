class ProductModel {
  int prId;
  int crId;
  String name;
  double price;
  String imageUrl;

  ProductModel({
    required this.name,
    required this.imageUrl,
    required this.crId,
    required this.price,
    required this.prId,
  });
}

List<ProductModel> products=[
  ProductModel(name:"Iphone" , imageUrl: "https://icentrumsklep.pl/userdata/public/gfx/4596/violet.png", crId: 1, prId: 1,price: 432),
  ProductModel(name:"Samsung" , imageUrl: "https://images.samsung.com/is/image/samsung/p6pim/in/2302/gallery/in-galaxy-s23-s918-446812-sm-s918bzrcins-534868449?650_519_PNG", crId: 1, prId: 1,price:343),
  ProductModel(name:"Redmi" , imageUrl: "https://tovar.uz/images/company/1281/tovar/58698/o_6116116a5a7a7.jpg", crId: 1, prId: 1,price: 234),
  ProductModel(name:"Mac" , imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzhJbbz-X4TGnF7ZVzKHo-8W3oX1ysw4tprA&s", crId: 2, prId: 1,price: 809),
  ProductModel(name:"Asus" , imageUrl: "https://t3.ftcdn.net/jpg/03/82/86/78/360_F_382867840_5bwvDkuH7NiZvxmdgLAcVZwlI6696ka1.jpg", crId: 2, prId: 1,price: 650),
  ProductModel(name:"Acer" , imageUrl: "https://assets.asaxiy.uz/product/items/desktop/e4da3b7fbbce2345d7772b0674a318d52023110417303140350T118NXDTFH.jpg.webp", crId: 2, prId: 1,price: 404),
  ProductModel(name:"Artel" , imageUrl: "https://tezz.uz/uploads/images/product/521/thumbs/202036-10501050.jpg", crId: 3, prId: 1,price:304),
  ProductModel(name:"Sony" , imageUrl: "https://shopatsc.com/cdn/shop/products/01-43X80L-logo-v2.jpg?v=1697708299", crId: 3, prId: 1,price: 432),
  ProductModel(name:"LG" , imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1aXn4AAibDrZqhNQAM5EUk4ZCYYIn6flO4g&s", crId: 3, prId: 1,price: 232),
  ProductModel(name:"Chair" , imageUrl: "https://t4.ftcdn.net/jpg/03/21/42/87/360_F_321428779_l8oQrLjoqZM5TIW22IAapbpOg0wgKufw.jpg", crId: 4, prId: 1,price: 31),
  ProductModel(name:"Sofa" , imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzVdYoT-7tCCckWkuV65bm2g7N0RQfVw64TQ&s", crId: 4, prId: 1,price: 33),
  ProductModel(name:"Table" , imageUrl: "https://st3.depositphotos.com/1014680/16209/i/450/depositphotos_162094036-stock-photo-used-wooden-table-isolated.jpg", crId: 4, prId: 1,price: 20),
  ProductModel(name:"Intex" , imageUrl: "https://m.media-amazon.com/images/I/81+QI8gxKTL.jpg", crId: 5, prId: 1,price: 66),
  ProductModel(name:"Kvidio" , imageUrl: "https://m.media-amazon.com/images/I/61BcRmV5jdL._AC_UF894,1000_QL80_.jpg", crId: 5, prId: 1,price: 53),
  ProductModel(name:"Zebronic" , imageUrl: "https://shop.zebronics.com/cdn/shop/products/Zeb-Jet-Pro-pic1.jpg?v=1659157507", crId: 5, prId: 1,price: 49),
  ProductModel(name:"Jacket" , imageUrl: "https://static8.depositphotos.com/1559986/1051/i/450/depositphotos_10513998-stock-photo-red-jacket.jpg", crId: 6, prId: 1,price: 100),
  ProductModel(name:"Trousers" , imageUrl: "https://media.istockphoto.com/id/1221134337/photo/front-views-black-trousers.jpg?s=612x612&w=0&k=20&c=XSEtHBJpWPQTo5FQgVTGrLBRiOJ7FuYIcUlKZzifGG8=", crId: 6, prId: 1,price:60),
  ProductModel(name:"Shirt" , imageUrl: "https://img.freepik.com/free-psd/isolated-white-t-shirt-front-view_125540-1194.jpg", crId: 6, prId: 1,price: 35),
];