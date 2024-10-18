import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:institutionapp/components/gallery_state.dart';
import 'package:institutionapp/components/item_card_component.dart';

class LegalEntitiesProfilePage extends StatefulWidget {
  const LegalEntitiesProfilePage({super.key});

  @override
  State<LegalEntitiesProfilePage> createState() =>
      LegalEntitiesProfilePageState();
}

class LegalEntitiesProfilePageState extends State<LegalEntitiesProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    setState(() {
      pickedFile = result?.files.first;
    });
  }
 
  Future uploadFile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);


    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);



  }

  Future uploadPicture(user, File profilePicture) async {
    UploadTask uploadTask = _storage
        .ref()
        .child('userProfilePictures/${user.id}/profilePicture.jpg')
        .putFile(profilePicture);

    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

    String downloadURL = await taskSnapshot.ref.getDownloadURL();

    return downloadURL;
  }



  @override
  Widget build(BuildContext context) {

    final name = currentUser.displayName;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).go('/edit_profile');
              },
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SizedBox.expand(
          child: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Meu Perfil",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                        Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0, top: 3.0),
          child: Material(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.file(File(pickedFile!.path!),
                  height: 160,
                  width: 170,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Column(
          children: [
            Align(
              child: Text(
                "$name",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Contato",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const Row(
              children: [
                Icon(Icons.phone_in_talk_outlined),
                Opacity(
                    opacity: 0.7,
                    child: Text(
                      "(71)1234-5678",
                      style: TextStyle(fontFamily: 'Poppins'),
                      textAlign: TextAlign.left,
                    ))
              ],
            ),
          ],
        )
      ],
    ),
                        const Padding(
                          padding: EdgeInsets.all(11.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Detalhes",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              ""),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(11.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Suas Necessidades",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                        const ItemCardComponent(),
                        const Padding(
                          padding: EdgeInsets.all(11.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Visitas",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 500, child: Gallery())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
