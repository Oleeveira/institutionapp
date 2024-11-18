import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:institutionapp/components/custom_text_field.dart';
import 'package:institutionapp/controllers/post_controller.dart';
import 'package:institutionapp/models/user_model.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  File? _selectedImg;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future pickImageFromGallery() async {
    final selectedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(
      () {
        if (_selectedImg != Null) {
          _selectedImg = File(selectedImage!.path);
        } else {
          return;
        }
      },
    );
  }

  Future uploadPicture(User user, File profilePicture) async {
    UploadTask uploadTask = _storage
        .ref()
        .child('userProfilePictures/${user.id}/profilePicture.jpg')
        .putFile(profilePicture);

    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

    String downloadURL = await taskSnapshot.ref.getDownloadURL();

    return downloadURL;
  }

  final PostController _controller = PostController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/bar_state');
          },
        ),
        backgroundColor: const Color.fromARGB(255, 3, 32, 106),
      ),
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                pickImageFromGallery();
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0, top: 30.0),
                child: Material(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Image(
                      image: (_selectedImg == null)
                          ? const AssetImage('assets/tigre.webp')
                          : FileImage(_selectedImg!) as ImageProvider,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Descreva a postagem:"),
            ),
            CustomTextField(
                type: TextInputType.multiline, controller: _controller.crtlDesc)
          ],
        ),
      ),
    );
  }
}
