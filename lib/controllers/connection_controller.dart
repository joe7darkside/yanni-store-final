import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityController extends GetxController {
  var connectionStatus = false.obs;
  @override
  void onInit() {
    connectionCheck();
    super.onInit();
  }

  @override
  void onClose() {
    connectionCheck();
    super.onClose();
  }

  connectionCheck() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      connectionStatus.value = true;
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      connectionStatus.value = true;
      // I am connected to a wifi network.
    } else if (connectivityResult == ConnectivityResult.none) {
      connectionStatus.value = false;
    }
  }
}
