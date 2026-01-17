import 'package:flutter/material.dart';
import '../services/mahasiswa_service.dart';

class HomePage extends StatelessWidget {
  final TextEditingController nama = TextEditingController();
  final TextEditingController jurusan = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CRUD Firebase")),
      body: Column(
        children: [
          TextField(controller: nama, decoration: InputDecoration(labelText: "Nama")),
          TextField(controller: jurusan, decoration: InputDecoration(labelText: "Jurusan")),
          ElevatedButton(
            onPressed: () {
              MahasiswaService().tambah(nama.text, jurusan.text);
            },
            child: Text("Tambah"),
          ),
          Expanded(
            child: StreamBuilder(
              stream: MahasiswaService().getData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return ListTile(
                      title: Text(doc['nama']),
                      subtitle: Text(doc['jurusan']),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          MahasiswaService().hapus(doc.id);
                        },
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
