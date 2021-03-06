// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_store.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardInfoAdapter extends TypeAdapter<CardInfo> {
  @override
  final int typeId = 0;

  @override
  CardInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardInfo(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CardInfo obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.passwordFormURL)
      ..writeByte(1)
      ..write(obj.passwordFormUsername)
      ..writeByte(2)
      ..write(obj.passwordFormPassword)
      ..writeByte(3)
      ..write(obj.passwordTOTPUrl)
      ..writeByte(4)
      ..write(obj.iconUrl)
      ..writeByte(5)
      ..write(obj.iconType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
