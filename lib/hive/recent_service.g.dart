// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_service.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecentServiceAdapter extends TypeAdapter<RecentService> {
  @override
  final int typeId = 0;

  @override
  RecentService read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentService(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      (fields[4] as List)?.cast<dynamic>(),
      fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, RecentService obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.serviceId)
      ..writeByte(1)
      ..write(obj.serviceName)
      ..writeByte(2)
      ..write(obj.serviceSummary)
      ..writeByte(3)
      ..write(obj.serviceLogoUrl)
      ..writeByte(4)
      ..write(obj.serviceTags)
      ..writeByte(5)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentServiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
