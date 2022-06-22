import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  String id;
  String user;
  int productQty;
  String productName;
  String productCategory;
  int productPrice;
  String imageUri;

  CartItem({
    this.id = '',
    this.productQty = 0,
    this.productName = '',
    this.productCategory = '',
    this.productPrice = 0,
    this.user = '',
    this.imageUri = '',
  });

  CartItem copyWith({
    String? id,
    String? user,
    int? productQty,
    String? productName,
    String? productCategory,
    int? productPrice,
    String? imageUri,
  }) {
    return CartItem(
      id: id ?? this.id,
      user: user ?? this.user,
      productQty: productQty ?? this.productQty,
      productName: productName ?? this.productName,
      productCategory: productCategory ?? this.productCategory,
      productPrice: productPrice ?? this.productPrice,
      imageUri: imageUri ?? this.imageUri,
    );
  }

  @override
  List<Object> get props => [
        id,
        user,
        productQty,
        productName,
        productCategory,
        productPrice,
        imageUri,
      ];
}
