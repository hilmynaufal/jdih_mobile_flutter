// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riwayat_dokumen_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RiwayatDokumenModelAdapter extends TypeAdapter<RiwayatDokumenModel> {
  @override
  final int typeId = 0;

  @override
  RiwayatDokumenModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RiwayatDokumenModel(
      id: fields[0] as String,
      judul: fields[1] as String,
      nomor: fields[2] as String,
      tahun: fields[3] as String,
      fileUrl: fields[4] as String?,
      tanggalDilihat: fields[5] as DateTime,
      kategori: fields[6] as String?,
      instansi: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RiwayatDokumenModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.judul)
      ..writeByte(2)
      ..write(obj.nomor)
      ..writeByte(3)
      ..write(obj.tahun)
      ..writeByte(4)
      ..write(obj.fileUrl)
      ..writeByte(5)
      ..write(obj.tanggalDilihat)
      ..writeByte(6)
      ..write(obj.kategori)
      ..writeByte(7)
      ..write(obj.instansi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RiwayatDokumenModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
