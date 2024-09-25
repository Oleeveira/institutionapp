import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class UserRegister extends StatefulWidget {
  UserRegister({super.key});
  TextEditingController textEditingController = TextEditingController();
  List<String> listNames = [];

  @override
  State<UserRegister> createState() => _UserRegisterState();
  
 
}

class _UserRegisterState extends State<UserRegister> {
   FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController textEditingController = TextEditingController();
  List<String> listNames = [];
  @override
   void initState() {
    refresh();
    db.collection("users").snapshots().listen((Query) {
      listNames = [];

      Query.docs.forEach((doc) {
        setState(() {
          listNames.add(doc.get("name"));
        });
      });
    });
    super.initState();
  }

  void refresh() async {
    QuerySnapshot query = await db.collection("users").get();
  }

  void userSave() {
    String id = const Uuid().v1();
    db.collection("users").doc(id).set({
      "name": textEditingController.text,
    });

    textEditingController.text = "";
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Salvo!"),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
