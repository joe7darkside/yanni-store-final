import 'package:get/get.dart';

class  BottonNavBar extends GetxController {
  var tabIndex=0;

  void onTab(int index){

    tabIndex=index;
    update();

  }
}