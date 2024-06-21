// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProposalAdapter extends TypeAdapter<Proposal> {
  @override
  final int typeId = 2;

  @override
  Proposal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Proposal(
      id: fields[0] as int,
      event: fields[1] as int,
      seeker: fields[2] as int?,
      sponsor: fields[3] as int?,
      status: fields[4] as int,
      sentDate: fields[5] as DateTime,
      lastAction: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Proposal obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.event)
      ..writeByte(2)
      ..write(obj.seeker)
      ..writeByte(3)
      ..write(obj.sponsor)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.sentDate)
      ..writeByte(6)
      ..write(obj.lastAction);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProposalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
