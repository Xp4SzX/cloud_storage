import 'package:cloud_firestore/cloud_firestore.dart';

class MahasiswaService {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('mahasiswa');

  Future<void> tambah(String nama, String jurusan) {
    return _ref.add({
      'nama': nama,
      'jurusan': jurusan,
    });
  }

  Stream<QuerySnapshot> getData() {
    return _ref.snapshots();
  }

  Future<void> hapus(String id) {
    return _ref.doc(id).delete();
  }
}
