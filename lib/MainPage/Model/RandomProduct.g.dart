// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RandomProduct.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RandomProductAdapter extends TypeAdapter<RandomProduct> {
  @override
  final int typeId = 1;

  @override
  RandomProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RandomProduct(
      id: fields[1] as int,
      productId: fields[2] as String,
      nameTm: fields[3] as String,
      nameRu: fields[4] as String,
      bodyTm: fields[5] as String,
      bodyRu: fields[6] as String,
      productCode: fields[7] as String?,
      price: fields[8] as double?,
      priceOld: fields[9] as double?,
      priceTm: fields[10] as double?,
      priceTmOld: fields[11] as double?,
      priceUsd: fields[12] as dynamic,
      priceUsdOld: fields[13] as dynamic,
      discount: fields[14] as int?,
      isActive: fields[15] as bool,
      sex: fields[16] as String,
      isNew: fields[17] as bool,
      isAction: fields[18] as bool?,
      rating: fields[19] as int,
      ratingCount: fields[20] as int,
      soldCount: fields[21] as int,
      likeCount: fields[22] as int,
      isNewExpire: fields[23] as String,
      isLiked: fields[24] as bool,
      categoryId: fields[25] as int,
      subcategoryId: fields[26] as int,
      brandId: fields[27] as int?,
      createdAt: fields[28] as DateTime,
      updatedAt: fields[29] as DateTime,
      images: (fields[30] as List).cast<Images>(),
      productSizes: (fields[31] as List?)?.cast<ProductSize>(),
    );
  }

  @override
  void write(BinaryWriter writer, RandomProduct obj) {
    writer
      ..writeByte(31)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.productId)
      ..writeByte(3)
      ..write(obj.nameTm)
      ..writeByte(4)
      ..write(obj.nameRu)
      ..writeByte(5)
      ..write(obj.bodyTm)
      ..writeByte(6)
      ..write(obj.bodyRu)
      ..writeByte(7)
      ..write(obj.productCode)
      ..writeByte(8)
      ..write(obj.price)
      ..writeByte(9)
      ..write(obj.priceOld)
      ..writeByte(10)
      ..write(obj.priceTm)
      ..writeByte(11)
      ..write(obj.priceTmOld)
      ..writeByte(12)
      ..write(obj.priceUsd)
      ..writeByte(13)
      ..write(obj.priceUsdOld)
      ..writeByte(14)
      ..write(obj.discount)
      ..writeByte(15)
      ..write(obj.isActive)
      ..writeByte(16)
      ..write(obj.sex)
      ..writeByte(17)
      ..write(obj.isNew)
      ..writeByte(18)
      ..write(obj.isAction)
      ..writeByte(19)
      ..write(obj.rating)
      ..writeByte(20)
      ..write(obj.ratingCount)
      ..writeByte(21)
      ..write(obj.soldCount)
      ..writeByte(22)
      ..write(obj.likeCount)
      ..writeByte(23)
      ..write(obj.isNewExpire)
      ..writeByte(24)
      ..write(obj.isLiked)
      ..writeByte(25)
      ..write(obj.categoryId)
      ..writeByte(26)
      ..write(obj.subcategoryId)
      ..writeByte(27)
      ..write(obj.brandId)
      ..writeByte(28)
      ..write(obj.createdAt)
      ..writeByte(29)
      ..write(obj.updatedAt)
      ..writeByte(30)
      ..write(obj.images)
      ..writeByte(31)
      ..write(obj.productSizes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RandomProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImagesAdapter extends TypeAdapter<Images> {
  @override
  final int typeId = 2;

  @override
  Images read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Images(
      id: fields[1] as int,
      productId: fields[2] as int,
      image: fields[3] as String,
      productcolorId: fields[4] as int?,
      createdAt: fields[5] as DateTime,
      updatedAt: fields[6] as DateTime,
      freeproductId: fields[7] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Images obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.productId)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.productcolorId)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt)
      ..writeByte(7)
      ..write(obj.freeproductId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductSizeAdapter extends TypeAdapter<ProductSize> {
  @override
  final int typeId = 3;

  @override
  ProductSize read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductSize(
      id: fields[1] as int,
      productSizeId: fields[2] as String,
      productId: fields[3] as int,
      productColorId: fields[4] as int?,
      size: fields[5] as String?,
      price: fields[6] as double?,
      priceOld: fields[7] as double?,
      priceTm: fields[8] as double?,
      priceTmOld: fields[9] as double?,
      priceUsd: fields[10] as double?,
      priceUsdOld: fields[11] as double?,
      discount: fields[12] as int?,
      createdAt: fields[13] as DateTime,
      updatedAt: fields[14] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ProductSize obj) {
    writer
      ..writeByte(14)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.productSizeId)
      ..writeByte(3)
      ..write(obj.productId)
      ..writeByte(4)
      ..write(obj.productColorId)
      ..writeByte(5)
      ..write(obj.size)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.priceOld)
      ..writeByte(8)
      ..write(obj.priceTm)
      ..writeByte(9)
      ..write(obj.priceTmOld)
      ..writeByte(10)
      ..write(obj.priceUsd)
      ..writeByte(11)
      ..write(obj.priceUsdOld)
      ..writeByte(12)
      ..write(obj.discount)
      ..writeByte(13)
      ..write(obj.createdAt)
      ..writeByte(14)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductSizeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
