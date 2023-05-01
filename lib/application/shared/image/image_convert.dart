import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class ImageConvert {
  Future<String?> imageToBase64(File? image) async {
    if (image != null) {
      final bytes = await image.readAsBytes();
      return base64Encode(bytes);
    }
    return null;
  }

  Uint8List base64ToImage(String image) {
    Uint8List bytesImage = const Base64Decoder().convert(image);
    return bytesImage;
  }
}
