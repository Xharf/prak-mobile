import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _namaLengkap = "";
  String _email = "";
  String _noHp= "";
  String _alamatRumah = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
                child: Text("Hai ${widget.username}!\nSelamat Datang",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: Text("Lengkapi Biodata",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: _buildForm(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: _buildButtonSubmit(),
            )
          ],
        ),
      ),
    );
  }

  Widget _formInput({
    required String hint,
    required String label,
    required Function(String value) setStateInput,
    int maxLines = 1
  }){
  return TextFormField(
    enabled: true,
    maxLines: maxLines,
    decoration: InputDecoration(
      hintText: hint,
      label: Text(label),
      contentPadding: EdgeInsets.all(12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: Colors.blue)
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: Colors.orange)
      ),
    ),
    onChanged: setStateInput,
  );
  }

  Widget _buildForm(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: _formInput(
              hint: "Masukkan Nama Lengkap",
              label: "Nama *",
              setStateInput: (value) {
                setState(() {
                  _namaLengkap = value;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: _formInput(
              hint: "Masukkan Alamat Email",
              label: "Email *",
              setStateInput: (value) {
                setState(() {
                  _email = value;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: _formInput(
              hint: "Masukkan No HP aktif",
              label: "No HP *",
              setStateInput: (value) {
                setState(() {
                  _noHp = value;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: _formInput(
              hint: "Masukkan Alamat Rumah",
              label: "Alamat Rumah *",
              setStateInput: (value) {
                setState(() {
                  _alamatRumah = value;
                });
              }),
        ),
      ],
    );
  }
  
  Widget _buildButtonSubmit(){
    return Container(
      child: ElevatedButton(
        onPressed: (){},
        child: Text("Submit"),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 15),
          textStyle: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
