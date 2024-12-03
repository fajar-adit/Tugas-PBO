import 'mahasiswa.dart';
import 'mata_kuliah.dart';

class KRS {
  Mahasiswa mahasiswa;
  List<MataKuliah> daftarMataKuliah = [];

  KRS(this.mahasiswa);

  void tambahMataKuliah(MataKuliah mataKuliah) {
    daftarMataKuliah.add(mataKuliah);
  }

  void cetakKRS() {
    print("KRS Mahasiswa ${mahasiswa.nama} (NIM: ${mahasiswa.nim})");
    print("Semester: ${mahasiswa.semester}");
    for (var matkul in daftarMataKuliah) {
      print("${matkul.kode} - ${matkul.nama} (${matkul.sks} SKS)");
    }
    print("");
  }
}
