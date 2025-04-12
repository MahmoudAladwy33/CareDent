import 'dart:io';
import 'package:caredent/core/widgets/default_user_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/utlils/app_images.dart';

class UserProfilePic extends StatefulWidget {
  const UserProfilePic({super.key});

  @override
  State<UserProfilePic> createState() => _UserProfilePicState();
}

class _UserProfilePicState extends State<UserProfilePic> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickCropAndSetImage(ImageSource source) async {
    final permissionStatus =
        source == ImageSource.camera
            ? await Permission.camera.request()
            : await Permission.photos.request();

    if (!permissionStatus.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "We need permission to access your ${source == ImageSource.camera ? 'camera' : 'photos'}",
          ),
        ),
      );
      return;
    }

    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile == null) return;

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Image Cropper',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(title: 'Image Cropper'),
      ],
    );

    if (croppedFile == null) return;

    setState(() {
      _imageFile = File(croppedFile.path);
    });

    // Upload to server here if needed
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      builder:
          (_) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Take a photo"),
                onTap: () {
                  Navigator.pop(context);
                  pickCropAndSetImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Choose from gallery"),
                onTap: () {
                  Navigator.pop(context);
                  pickCropAndSetImage(ImageSource.gallery);
                },
              ),
            ],
          ),
    );
  }

  void _showImagePreviewDialog() {
    showDialog(
      context: context,
      builder:
          (_) => Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(16),
            child: Stack(
              children: [
                InteractiveViewer(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child:
                        _imageFile != null
                            ? Image.file(_imageFile!)
                            : Image.asset(AppImages.homeProfilePic),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 150.h,
      left: 135.w,
      child: Stack(
        children: [
          _imageFile != null
              ? GestureDetector(
                onLongPress: _showImagePreviewDialog,
                child: Container(
                  width: 120.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                    image: DecorationImage(image: FileImage(_imageFile!)),
                  ),
                ),
              )
              : DefaultUserImg(
                iconSize: 110.sp,
                containerWidth: 120.w,
                containerHeight: 120.h,
              ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: _showImageSourceDialog,
              child: Image.asset(
                AppImages.profileCameraUp,
                width: 32.w,
                height: 32.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
