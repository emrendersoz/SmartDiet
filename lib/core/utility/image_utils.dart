import 'package:image_picker/image_picker.dart';

class PickImage {

  PickImage._();

  static final _picker = ImagePicker();

  static Future<XFile?> pickImageFromGallery() async {
    return _picker.pickImage(source: ImageSource.gallery);
  }

  static Future<XFile?> pickImageFromCamera() async {
    return _picker.pickImage(source: ImageSource.camera);
  }
}
