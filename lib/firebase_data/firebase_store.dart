import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController {
  final CollectionReference _firestore =
      FirebaseFirestore.instance.collection('products');
  final CollectionReference _firestore_users =
      FirebaseFirestore.instance.collection('users');

  // @override
  // onInit() {
  //   readItems();
  // }

  addItem() async {
    var documentReference =
        _firestore.doc('piano').collection('piano-products').doc();

    Map<String, dynamic> data = <String, dynamic>{
      'descraption': 'descraption',
      'image': 'image',
      'price': '1',
      'rate': '2',
      'title': 'title'
    };
    await documentReference
        .set(data)
        .whenComplete(() => print('$data'))
        .catchError((e) => print(e));
  }

  readItems() {
    CollectionReference notesItemCollection =
        _firestore.doc('piano').collection('piano-products');

    print(notesItemCollection.get().toString());
    // notesItemCollection.snapshots();
  }
}
