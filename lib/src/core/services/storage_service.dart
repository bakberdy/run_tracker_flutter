import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class StorageService {
  final _storage = FirebaseStorage.instance;

  Future<String> uploadRunPhoto({
  required File file,
  required String userId,
}) async {
  final path = 'run_photos/$userId/${DateTime.now().millisecondsSinceEpoch}.jpg';
  final ref = _storage.ref().child(path);
  print('[StorageService] Start uploading to: $path');

  try {
    final uploadTask = ref.putFile(file);
    
final snapshot = await ref.putFile(file).timeout(Duration(seconds: 10));

    print('[StorageService] Upload complete. Bytes transferred: ${snapshot.totalBytes}');
    
    final url = await ref.getDownloadURL();
    print('[StorageService] Download URL: $url');

    return url;
  } catch (e, stack) {
    print('[StorageService] Upload error: $e');
    print('[StorageService] Stack: $stack');
    rethrow;
  }
}

}
