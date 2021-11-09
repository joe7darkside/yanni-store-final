import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductModel extends GetxController {
  var id = 0.obs;
  var title = ''.obs;
  var price = ''.obs;
  var image = ''.obs;
  var rating = 0.obs;
  var selectedConut = 1.obs;
  var quantity = 0.obs;
  var returnURL;
  final CollectionReference _firestore =
      FirebaseFirestore.instance.collection('products');
// Image Picker
  List<File> _images = [];
  // File? _image; // Used only if you need a single picture

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
    DocumentReference imageRef =
        _firestore.doc('piano').collection('piano-products').doc('image');
  }

  Future<void> saveImages(List<File> _images, DocumentReference ref) async {
    _images.forEach((image) async {
      String imageURL = await uploadFile(image);
      ref.update({
        "images": FieldValue.arrayUnion([imageURL])
      });
    });
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

  Future<void> downloadURLExample() async {
    String downloadURL = await FirebaseStorage.instance
        .ref('users/123/avatar.jpg')
        .getDownloadURL();
// Within your widgets:
// Image.network(downloadURL);
  }

  @override
  onInit() {
    // readItems();
    super.onInit();
  }

  readItems() {
    CollectionReference notesItemCollection =
        _firestore.doc('piano').collection('piano-products');

    notesItemCollection.get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
      });
    });
  }

  // ProductModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   title = json['title'];
  //   price = json['price'];
  //   image = json['image'];
  // }
}
