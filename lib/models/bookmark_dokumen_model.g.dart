// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_dokumen_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookmarkDokumenModelAdapter extends TypeAdapter<BookmarkDokumenModel> {
  @override
  final int typeId = 1;

  @override
  BookmarkDokumenModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookmarkDokumenModel(
      id: fields[0] as String?,
      idJenis: fields[1] as String?,
      idStatus: fields[2] as String?,
      nama: fields[3] as String?,
      namaInggris: fields[4] as String?,
      no: fields[5] as String?,
      tahun: fields[6] as String?,
      tanggalDitetapkan: fields[7] as String?,
      tanggalDiundangkan: fields[8] as String?,
      katalog: fields[9] as String?,
      abstrak: fields[10] as String?,
      penganti: fields[11] as String?,
      jumlahUnduh: fields[12] as String?,
      dibaca: fields[13] as String?,
      didownload: fields[14] as String?,
      visible: fields[15] as String?,
      sumber: fields[16] as String?,
      subjek: fields[17] as String?,
      statusPeraturan: fields[18] as String?,
      bahasa: fields[19] as String?,
      lokasi: fields[20] as String?,
      bidangHukum: fields[21] as String?,
      kodeLampiran: fields[22] as String?,
      tempatPenetapan: fields[23] as String?,
      tentang: fields[24] as String?,
      jenisDokumen: fields[25] as String?,
      createdAt: fields[26] as String?,
      createdBy: fields[27] as String?,
      updatedAt: fields[28] as String?,
      updatedBy: fields[29] as String?,
      statusNama: fields[30] as String?,
      jenisId: fields[31] as String?,
      jenisNama: fields[32] as String?,
      jenisKeterangan: fields[33] as String?,
      pathFileAbstrak: fields[34] as String?,
      pathFileInggris: fields[35] as String?,
      pathPeraturan: fields[36] as String?,
      dokumenId: fields[37] as String?,
      namaDokumen: fields[38] as String?,
      judul: fields[39] as String?,
      tanggalDibookmark: fields[40] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, BookmarkDokumenModel obj) {
    writer
      ..writeByte(41)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.idJenis)
      ..writeByte(2)
      ..write(obj.idStatus)
      ..writeByte(3)
      ..write(obj.nama)
      ..writeByte(4)
      ..write(obj.namaInggris)
      ..writeByte(5)
      ..write(obj.no)
      ..writeByte(6)
      ..write(obj.tahun)
      ..writeByte(7)
      ..write(obj.tanggalDitetapkan)
      ..writeByte(8)
      ..write(obj.tanggalDiundangkan)
      ..writeByte(9)
      ..write(obj.katalog)
      ..writeByte(10)
      ..write(obj.abstrak)
      ..writeByte(11)
      ..write(obj.penganti)
      ..writeByte(12)
      ..write(obj.jumlahUnduh)
      ..writeByte(13)
      ..write(obj.dibaca)
      ..writeByte(14)
      ..write(obj.didownload)
      ..writeByte(15)
      ..write(obj.visible)
      ..writeByte(16)
      ..write(obj.sumber)
      ..writeByte(17)
      ..write(obj.subjek)
      ..writeByte(18)
      ..write(obj.statusPeraturan)
      ..writeByte(19)
      ..write(obj.bahasa)
      ..writeByte(20)
      ..write(obj.lokasi)
      ..writeByte(21)
      ..write(obj.bidangHukum)
      ..writeByte(22)
      ..write(obj.kodeLampiran)
      ..writeByte(23)
      ..write(obj.tempatPenetapan)
      ..writeByte(24)
      ..write(obj.tentang)
      ..writeByte(25)
      ..write(obj.jenisDokumen)
      ..writeByte(26)
      ..write(obj.createdAt)
      ..writeByte(27)
      ..write(obj.createdBy)
      ..writeByte(28)
      ..write(obj.updatedAt)
      ..writeByte(29)
      ..write(obj.updatedBy)
      ..writeByte(30)
      ..write(obj.statusNama)
      ..writeByte(31)
      ..write(obj.jenisId)
      ..writeByte(32)
      ..write(obj.jenisNama)
      ..writeByte(33)
      ..write(obj.jenisKeterangan)
      ..writeByte(34)
      ..write(obj.pathFileAbstrak)
      ..writeByte(35)
      ..write(obj.pathFileInggris)
      ..writeByte(36)
      ..write(obj.pathPeraturan)
      ..writeByte(37)
      ..write(obj.dokumenId)
      ..writeByte(38)
      ..write(obj.namaDokumen)
      ..writeByte(39)
      ..write(obj.judul)
      ..writeByte(40)
      ..write(obj.tanggalDibookmark);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookmarkDokumenModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
