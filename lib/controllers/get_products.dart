import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetProductsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final title = [].obs;
  final price = [].obs;
  final rating = [].obs;
  final likes = [].obs;
  final images = [].obs;
  final category = [].obs;
  final descraption = [].obs;
  readItems() {
    CollectionReference productsCollection = _firestore
        .collection('products')
        .doc('piano')
        .collection('piano-products');

    productsCollection.get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        title.value.add(result.get('title'));
        likes.value.add(result.get('likes'));
        price.value.add(result.get('price'));
        descraption.value.add(result.get('descraption'));
        images.value.add(result.get('image'));
        category.value.add(result.get('category'));
        rating.value.add(result.get('rating'));

        print('$title\n $likes\n $price\n $images\n $category');
      }
    });
  }

  @override
  void refresh() {
    super.refresh();
  }

  @override
  void onInit() {
    readItems();
    super.onInit();
  }
}
