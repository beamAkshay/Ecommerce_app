// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartProductDataAdapter extends TypeAdapter<CartProductData> {
  @override
  final int typeId = 0;

  @override
  CartProductData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartProductData(
      item_quantity: fields[0] as int?,
      id: fields[1] as int?,
      sku: fields[2] as String?,
      name: fields[3] as String?,
      slug: fields[4] as String?,
      description: fields[5] as String?,
      excerpt: fields[6] as String?,
      price: fields[7] as double?,
      saleprice: fields[8] as double?,
      quantity: fields[9] as int?,
      related_products: fields[10] as String?,
      images: (fields[11] as List?)?.cast<TypeImage>(),
      enabled: fields[12] as int?,
      route_id: fields[13] as int?,
      fixed_quantity: fields[14] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CartProductData obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.item_quantity)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.sku)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.slug)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.excerpt)
      ..writeByte(7)
      ..write(obj.price)
      ..writeByte(8)
      ..write(obj.saleprice)
      ..writeByte(9)
      ..write(obj.quantity)
      ..writeByte(10)
      ..write(obj.related_products)
      ..writeByte(11)
      ..write(obj.images)
      ..writeByte(12)
      ..write(obj.enabled)
      ..writeByte(13)
      ..write(obj.route_id)
      ..writeByte(14)
      ..write(obj.fixed_quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartProductDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
