import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SecurityKey extends StatefulWidget {
  SecurityKey({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String value = '';

  @override
  _SecurityKeyState createState() => _SecurityKeyState();
}

class _SecurityKeyState extends State<SecurityKey> {
  String _errorMessage = '';

  void validate() {
    setState(() {
      _errorMessage = '';
      if (widget.nameController.text.isEmpty) {
        _errorMessage = 'Document name cannot be empty';
      } else if (widget.passwordController.text.isEmpty) {
        _errorMessage = 'Password cannot be empty';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[200],
        elevation: 0,
        title: const Text('Save Your Password Here'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              Text(
                "Enter Your Document Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: widget.nameController,
                decoration: InputDecoration(
                  hintText: "Document Name",
                  prefixIcon: Icon(Icons.drive_file_rename_outline, color: Colors.deepPurple),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Enter the Password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: widget.passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.security, color: Colors.deepPurple),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16),
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
              ElevatedButton(
                child: Text(
                  "ENTER",
                  style: TextStyle(color: Colors.black, fontSize: 21),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                onPressed: () {
                  validate();
                  if (_errorMessage.isEmpty) {
                    CollectionReference collRef = FirebaseFirestore.instance.collection('document');
                    collRef.add({
                      'name': widget.nameController.text,
                      'password': widget.passwordController.text,
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
