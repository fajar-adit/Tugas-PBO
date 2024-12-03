import 'dart:io';
import 'mahasiswa.dart';
import 'mata_kuliah.dart';
import 'krs.dart';
import 'nilai.dart';

void main() {
  // Data mahasiswa
  Mahasiswa mahasiswa = Mahasiswa("230103100", "Fajar Adit Pratama", 3);

  MataKuliah matkul1 = MataKuliah("MK001", "Pemrograman WEB", 3);
  MataKuliah matkul2 = MataKuliah("MK002", "Bahasa Inggris", 3);
  MataKuliah matkul3 = MataKuliah("MK003", "Pemrograman Berorientasi Objek", 3);

  KRS krs = KRS(mahasiswa);
  krs.tambahMataKuliah(matkul1);
  krs.tambahMataKuliah(matkul2);
  krs.tambahMataKuliah(matkul3);

  print("===== KARTU RENCANA STUDI =====");
  print("Mahasiswa:");
  print("NIM: ${mahasiswa.nim}");
  print("Nama: ${mahasiswa.nama}");
  print("Semester: ${mahasiswa.semester}");
  print("\nMata Kuliah yang Diambil:");
  for (var matkul in krs.daftarMataKuliah) {
    print("${matkul.nama} (${matkul.sks} SKS)");
  }

  print("\n===== INPUT NILAI MAHASISWA =====");
  List<Nilai> daftarNilai = [];
  for (var matkul in krs.daftarMataKuliah) {
    stdout.write("Masukkan nilai untuk ${matkul.nama}: ");
    double nilai = double.parse(stdin.readLineSync()!);
    daftarNilai.add(Nilai(matkul, nilai));
  }

  print("\n===== TRANSKRIP NILAI =====");
  print("Mahasiswa:");
  print("NIM: ${mahasiswa.nim}");
  print("Nama: ${mahasiswa.nama}");
  print("Semester: ${mahasiswa.semester}");
  print("\nDaftar Mata Kuliah dan Nilai:");
  double totalBobot = 0;
  int totalSKS = 0;
  for (var nilai in daftarNilai) {
    double bobot = hitungBobot(nilai.nilai);
    double bobotNilai = bobot * nilai.mataKuliah.sks;
    totalBobot += bobotNilai;
    totalSKS += nilai.mataKuliah.sks;
    print(
        "${nilai.mataKuliah.nama} (${nilai.mataKuliah.sks} SKS): ${nilai.nilai.toStringAsFixed(1)} (Bobot: ${bobotNilai.toStringAsFixed(1)})");
  }

  double ipk = totalSKS > 0 ? totalBobot / totalSKS : 0;
  print("\nIPK: ${ipk.toStringAsFixed(3)}");
}

double hitungBobot(double nilai) {
  if (nilai >= 85) return 4.0;
  if (nilai >= 70) return 3.0;
  if (nilai >= 55) return 2.0;
  if (nilai >= 40) return 1.0;
  return 0.0;
}
