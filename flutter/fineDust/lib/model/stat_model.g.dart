// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatModelAdapter extends TypeAdapter<StatModel> {
  @override
  final int typeId = 1;

  @override
  StatModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatModel(
      seoul: fields[0] as double,
      gyeonggi: fields[1] as double,
      incheon: fields[2] as double,
      daejeon: fields[3] as double,
      sejong: fields[4] as double,
      chungnam: fields[5] as double,
      chungbuk: fields[6] as double,
      gyeongnam: fields[7] as double,
      gwangju: fields[8] as double,
      jeonbuk: fields[9] as double,
      gyeongbuk: fields[10] as double,
      daegu: fields[11] as double,
      ulsan: fields[12] as double,
      busan: fields[13] as double,
      jeonnam: fields[14] as double,
      gangwon: fields[15] as double,
      jeju: fields[16] as double,
      dataTime: fields[17] as DateTime,
      itemCode: fields[18] as ItemCode,
    );
  }

  @override
  void write(BinaryWriter writer, StatModel obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.seoul)
      ..writeByte(1)
      ..write(obj.gyeonggi)
      ..writeByte(2)
      ..write(obj.incheon)
      ..writeByte(3)
      ..write(obj.daejeon)
      ..writeByte(4)
      ..write(obj.sejong)
      ..writeByte(5)
      ..write(obj.chungnam)
      ..writeByte(6)
      ..write(obj.chungbuk)
      ..writeByte(7)
      ..write(obj.gyeongnam)
      ..writeByte(8)
      ..write(obj.gwangju)
      ..writeByte(9)
      ..write(obj.jeonbuk)
      ..writeByte(10)
      ..write(obj.gyeongbuk)
      ..writeByte(11)
      ..write(obj.daegu)
      ..writeByte(12)
      ..write(obj.ulsan)
      ..writeByte(13)
      ..write(obj.busan)
      ..writeByte(14)
      ..write(obj.jeonnam)
      ..writeByte(15)
      ..write(obj.gangwon)
      ..writeByte(16)
      ..write(obj.jeju)
      ..writeByte(17)
      ..write(obj.dataTime)
      ..writeByte(18)
      ..write(obj.itemCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemCodeAdapter extends TypeAdapter<ItemCode> {
  @override
  final int typeId = 2;

  @override
  ItemCode read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ItemCode.PM10;
      case 1:
        return ItemCode.PM25;
      case 2:
        return ItemCode.NO2;
      case 3:
        return ItemCode.O3;
      case 4:
        return ItemCode.CO;
      case 5:
        return ItemCode.SO2;
      default:
        return ItemCode.PM10;
    }
  }

  @override
  void write(BinaryWriter writer, ItemCode obj) {
    switch (obj) {
      case ItemCode.PM10:
        writer.writeByte(0);
        break;
      case ItemCode.PM25:
        writer.writeByte(1);
        break;
      case ItemCode.NO2:
        writer.writeByte(2);
        break;
      case ItemCode.O3:
        writer.writeByte(3);
        break;
      case ItemCode.CO:
        writer.writeByte(4);
        break;
      case ItemCode.SO2:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemCodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
