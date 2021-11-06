import 'package:get/get.dart';

class  BottonNav extends GetxController {
  var tabIndex=0;

  void onTab(int index){

    tabIndex=index;
    update();

  }
}