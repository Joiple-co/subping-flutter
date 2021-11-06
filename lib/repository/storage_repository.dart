// import 'dart:io';

// import 'package:amplify_flutter/amplify.dart';

// class StorageRepository {
//   Future<void> uploadImageFileToS3(File file) async {
//     try {
//       final fileName = DateTime.now().toIso8601String();
//       final result = await Amplify.Storage.uploadFile(
//         local: file,
//         key: fileName + ".jpg",
//       );
//     } catch (e) {
//       print(e);
//     }
//   }
// }
