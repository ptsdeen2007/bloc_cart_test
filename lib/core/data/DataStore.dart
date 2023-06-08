import 'package:cart_task/core/models/Product.dart';

class DataStore{
  static DataStore? _instance;
  DataStore._();

  static DataStore get instance{
    _instance??=DataStore._();
    return _instance!;
  }
  List<Product> get products=>_products;
  List<Product> _products = [
    Product(
        title: "Product 1",
        price: 19.5,
        image: "https://example.com/product1.jpg",
        description: "This is the description for Product 1.",
        productId: 1
    ),
    Product(
        title: "Product 2",
        price: 29.0,
        image: "https://example.com/product2.jpg",
        description: "This is the description for Product 2.",
        productId: 2
    ),
    Product(
        title: "Product 3",
        price: 39.5,
        image: "https://example.com/product3.jpg",
        description: "This is the description for Product 3.",
        productId: 3
    ),
    Product(
        title: "Product 4",
        price: 49.5,
        image: "https://example.com/product4.jpg",
        description: "This is the description for Product 4.",
        productId: 4
    ),
    Product(
        title: "Product 5",
        price: 59.2,
        image: "https://example.com/product5.jpg",
        description: "This is the description for Product 5.",
        productId: 5
    ),
    Product(
        title: "Product 6",
        price: 69.5,
        image: "https://example.com/product6.jpg",
        description: "This is the description for Product 6.",
        productId: 6
    ),
    Product(
        title: "Product 7",
        price: 79.5,
        image: "https://example.com/product7.jpg",
        description: "This is the description for Product 7.",
        productId: 7
    ),
    Product(
        title: "Product 8",
        price: 89.5,
        image: "https://example.com/product8.jpg",
        description: "This is the description for Product 8.",
        productId: 8
    ),
    Product(
        title: "Product 9",
        price: 99.5,
        image: "https://example.com/product9.jpg",
        description: "This is the description for Product 9.",
        productId: 9
    ),
    Product(
        title: "Product 10",
        price: 109.5,
        image: "https://example.com/product10.jpg",
        description: "This is the description for Product 10.",
        productId: 10
    ),
  ];

}