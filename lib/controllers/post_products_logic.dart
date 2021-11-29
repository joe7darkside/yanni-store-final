import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostProductController extends GetxController {
  final TextEditingController title = TextEditingController();
  final TextEditingController category = TextEditingController();
  final TextEditingController descraption = TextEditingController();
  final TextEditingController price = TextEditingController();
  final int rating = 0;
  final bool isLike = false;

  var image = [].obs;
  var returnURL;
  List<File> _images = [];
  final CollectionReference _firestore =
      FirebaseFirestore.instance.collection('products');
  DocumentReference imageRef = FirebaseFirestore.instance
      .collection('products')
      .doc('piano')
      .collection('piano-products')
      .doc();

  Future getImage(bool gallery) async {
    ImagePicker picker = ImagePicker();
    PickedFile? pickedFile;
    // Let user select photo from gallery
    if (gallery) {
      pickedFile =
          await picker.getImage(source: ImageSource.gallery, imageQuality: 75);
    }
    // Otherwise open camera to get new photo
    else {
      pickedFile = await picker.getImage(
        source: ImageSource.camera,
      );
    }
    if (pickedFile != null) {
      _images.add(File(pickedFile.path));
      image.add(File(pickedFile.path));
      // print(image.value);
    } else {
      print('No image selected.');
    }
    update();
  }

  Future<String> uploadFile(File _image) async {
    var storageReference =
        FirebaseStorage.instance.ref().child('image/${basename(_image.path)}');
    var uploadTask = storageReference.putFile(_image);
    await uploadTask.whenComplete(() => null);
    print('File Uploaded');
    // String returnURL;
    await storageReference.getDownloadURL().then((fileURL) {
      returnURL = fileURL;
    });
    return returnURL;
  }

  Future<void> saveImages() async {
    _images.forEach((image) async {
      String imageURL = await uploadFile(image);
      imageRef.set({
        "title": title.text,
        "rating": rating,
        "price": price.text,
        "descraption": descraption.text,
        "category": category.text,
        "likes": isLike,
        "image": FieldValue.arrayUnion([imageURL])
      });
    });
  }
}
