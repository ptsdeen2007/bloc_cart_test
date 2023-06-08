class Product {
  final productId;
  final String title;
  final double price;
  final String image;
  final String description;
   int qty;
   double get totalPrice=>price*qty;


  Product({
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.productId,
    this.qty=0
  });
}
