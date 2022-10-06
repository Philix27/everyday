// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:everydayntroller/hive_controller.dart';
// import 'package:everydayre/settings.dart';
// import 'package:get/get.dart';

// class RemoteConfig extends GetxController {
//   DateTime getExpiryDate() =>
//       DateTime.tryParse(Get.find<HiveController>()
//           .remoteConfigBox
//           .get('expDate')
//           .toString()) ??
//       Timestamp.fromDate(DateTime.utc(2022, 5, 2)).toDate();

//   int getLimitCount() =>
//       int.tryParse(Get.find<HiveController>()
//           .remoteConfigBox
//           .get('limitCount')
//           .toString()) ??
//       100;

//   final Rx<Setting> _setExp = Rx<Setting>();
//   Setting get user => _setExp.value;

//   Stream<Setting> settingsStream() {
//     return FirebaseFirestore.instance
//         .collection('Settings')
//         .doc("version1")
//         .snapshots()
//         .map((event) {
//       final Setting settingsModel = Setting.fromDocumentsnapshot(event);
//       Get.find<HiveController>()
//           .remoteConfigBox
//           .put('expDate', settingsModel.expiryDate.toDate().toString());
//       Get.find<HiveController>()
//           .remoteConfigBox
//           .put('limitCount', settingsModel.limitCount);

//       return settingsModel;
//     });
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     _setExp.bindStream(settingsStream());
//   }
// }
