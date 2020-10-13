import 'package:image_picker/image_picker.dart';

Future<String> getImageFunction() async {
  final imagePicker = ImagePicker();
  final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);

  print("IMAGE PATH IS:");
  print(pickedFile?.path);

  return pickedFile?.path;
}
