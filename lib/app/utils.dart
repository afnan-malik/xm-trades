import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'config/color.dart';
import 'config/global_variables.dart';

class Utils {
  static String getImagePath(String name, {String format = 'png'}) {
    return 'assets/images/$name.$format';
  }

  static String getIconPath(String name, {String format = 'png'}) {
    return 'assets/icons/$name.$format';
  }

  static String getTempImages(String name, {String format = 'png'}) {
    return 'assets/tempImages/$name.$format';
  }


  static Future<bool> getPermissionStatus({Permission permission = Permission.photos}) async {
    var status = await permission.status;
    print(status.isDenied);

    if (status.isGranted) {
      return true;

      // onNewCameraSelected(cameras[0]);
      // refreshAlreadyCapturedImages();
    } else if (status.isDenied) {
      await permission.request();
      status = await permission.status;
      if (status.isGranted) {
        return true;
      } else {
        return false;
      }
    } else {
      await openAppSettings();
      status = await permission.status;
      if (status.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }

  static Future<bool> getPermissionLocationStatus() async {
    var status = await Permission.location.status;
    print('Initial status: $status');

    if (status.isGranted) {
      print('Permission already granted');
      return true;
    } else if (status.isDenied) {
      print('Permission denied, requesting...');
      await Permission.location.request();
      status = await Permission.location.status;
      print('Status after request: $status');
      if (status.isGranted) {
        print('Permission granted after request');
        return true;
      } else {
        print('Permission still denied');
        return false;
      }
    } else {
      print('Permission status: $status, opening app settings');
      await openAppSettings();
      status = await Permission.location.status;
      print('Status after opening settings: $status');
      if (status.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }

  static Future<File?> getAudioFromGallery() async {
    try {
      final result = await FilePicker.platform.pickFiles(type: FileType.audio);
      if (result != null && result.files.single.path != null) {
        File audioFile = File(result.files.single.path!);
        Get.log('${DateTime.now()} [MediaPickerUtils.getAudioFromGallery] $audioFile');
        return audioFile;
      }
    } catch (e) {
      Get.log('Error picking audio file: $e');
    }
    return null;
  }

  static Future getVideoFromGallery() async {
    final pickedFile = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      File? returnFile = File(pickedFile.path);
      Get.log(
          '${DateTime.now()} [VideoPicker.getVideoFromGallery] $returnFile');
      return returnFile;
    }
  }

  static Future getVideoFromCamera() async {
    final pickedFile = await ImagePicker().pickVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      File videoFile = File(pickedFile.path);
      Get.log('${DateTime.now()} [VideoPicker.getVideoFromCamera] $videoFile');
      return videoFile;
    }
  }

  static Future getImageFromGallery() async {
    final file = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);
    if (file != null) {
      File? returnFile = await refineImage(File(file.path));
      Get.log(
          '${DateTime.now()} [RefineImage.getImageFromGallery] $returnFile');
      return returnFile;
    }
  }

  static Future getImageFromCamera() async {
    final pickedFile = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.camera);
    if (pickedFile != null) {
      File? returnFile = await refineImage(File(pickedFile.path));
      Get.log(
          '${DateTime.now()} [RefineImage.getImageFromGallery] $returnFile');
      return returnFile;
    }
  }

  static Future<File?> refineImage(File pickedFile) async {
    // final tempDir = await getTemporaryDirectory();

    File toCompress = pickedFile;

    print(toCompress.path);

    CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
      sourcePath: toCompress.path,
      aspectRatio: CropAspectRatio(ratioX: 9, ratioY: 16),
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Refine Image',
            toolbarColor: AppColors.black,
            toolbarWidgetColor: AppColors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            activeControlsWidgetColor: AppColors.black,
            backgroundColor: AppColors.black,
            statusBarColor: AppColors.black,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Refine Image',
        )
      ],
    );

    if (croppedFile != null) {
      pickedFile = File(croppedFile.path);
      return pickedFile;
    } else {
      return null;
    }
  }

  static double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  static String getDay(DateTime createdAt) {
    //DateTime currentDate = DateTime.now();
    final today = DateTime.now().subtract(const Duration(days: 0));
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    final thisWeek7 = DateTime.now().subtract(const Duration(days: 7));
    final thisWeek6 = DateTime.now().subtract(const Duration(days: 6));
    final thisWeek5 = DateTime.now().subtract(const Duration(days: 5));
    final thisWeek4 = DateTime.now().subtract(const Duration(days: 4));
    final thisWeek3 = DateTime.now().subtract(const Duration(days: 3));
    final thisWeek2 = DateTime.now().subtract(const Duration(days: 2));

    if (today.day == createdAt.day) {
      return "Today";
    }

    // else if ((currentDate.day - createdAt.day <= 1) || (currentDate.day - createdAt.day == -29)  || (currentDate.day - createdAt.day == -30) || (currentDate.day - createdAt.day == -27)) {
    //   return "Yesterday";
    // }

    else if (yesterday.day == createdAt.day) {
      return "Yesterday";
    }
    // else if (currentDate.day - createdAt.day == 7 ||
    //     currentDate.day - createdAt.day < 0) {
    //   return "This Week";
    // }
    else if (thisWeek7.day == createdAt.day) {
      return "This Week";
    } else if (thisWeek6.day == createdAt.day) {
      return "This Week";
    } else if (thisWeek5.day == createdAt.day) {
      return "This Week";
    } else if (thisWeek4.day == createdAt.day) {
      return "This Week";
    } else if (thisWeek3.day == createdAt.day) {
      return "This Week";
    } else if (thisWeek2.day == createdAt.day) {
      return "This Week";
    }
    // else if (currentDate.day - createdAt.day > 7 &&
    //     currentDate.month - createdAt.month >= 1) {
    //   return "Earlier";
    // }
    return "Earlier";
  }

  static String formatTimeAgo(DateTime createdAt) {
    final now = DateTime.now();
    final difference = now.difference(createdAt);
    if (difference.inDays > 1) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays == 1) {
      return '1 day ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'just now';
    }
  }

  static showToast({required String message, int time = 2}) {
    Fluttertoast.showToast(
        msg: message,
        timeInSecForIosWeb: 3,
        backgroundColor: AppColors.red,
        textColor: AppColors.white,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG);
  }
}
