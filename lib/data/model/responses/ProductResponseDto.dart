import '../../../domin/entity/ProductResponseEntity.dart';

class ProductResponseDto extends ProductResponseEntity {
  ProductResponseDto({
    super.products,
    super.total,
    super.skip,
    super.limit,
  });

  ProductResponseDto.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductsDto.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
}

class ProductsDto extends ProductsEntity {
  ProductsDto({
    super.id,
    super.title,
    super.description,
    super.category,
    super.price,
    super.discountPercentage,
    super.rating,
    super.stock,
    super.tags,
    super.brand,
    super.sku,
    super.weight,
    super.warrantyInformation,
    super.shippingInformation,
    super.availabilityStatus,
    super.returnPolicy,
    super.minimumOrderQuantity,
    super.images,
    super.thumbnail,
  });

  ProductsDto.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    brand = json['brand'];
    sku = json['sku'];
    weight = json['weight'];

    warrantyInformation = json['warrantyInformation'];
    shippingInformation = json['shippingInformation'];
    availabilityStatus = json['availabilityStatus'];

    returnPolicy = json['returnPolicy'];
    minimumOrderQuantity = json['minimumOrderQuantity'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    thumbnail = json['thumbnail'];
  }
}
