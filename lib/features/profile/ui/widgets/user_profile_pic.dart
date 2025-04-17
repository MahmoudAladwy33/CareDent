import 'dart:io';
import 'package:caredent/core/models/user_model.dart';
import 'package:caredent/core/theme/colors_manager.dart';
import 'package:caredent/core/widgets/default_user_img.dart';
import 'package:caredent/features/profile/logic/update_user_image_cubit/update_user_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/logic/user_cubit/user_cubit.dart';
import '../../../../core/utlils/app_images.dart';
import '../../logic/update_user_image_cubit/update_user_image_state.dart';

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

    context.read<UpdateUserImageCubit>().uploadImage(_imageFile!);
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

  void _showImagePreviewDialog(UserModel user) {
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
                    child: Image.network(user.profileImg!),
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
    final user = context.watch<UserCubit>().state.user;

    return BlocListener<UpdateUserImageCubit, UpdateUserImageState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (data) {
            final updatedUser = context.read<UserCubit>().state.user?.copyWith(
              profileImg: data.data.profileImg,
            );

            if (updatedUser != null) {
              context.read<UserCubit>().setUser(updatedUser);
            }
          },
        );
      },
      child: BlocBuilder<UpdateUserImageCubit, UpdateUserImageState>(
        builder: (context, state) {
          final isLoading = state is Loading;

          return Positioned(
            top: 150.h,
            left: 135.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                (user?.profileImg != null &&
                        user!.profileImg!.trim().isNotEmpty)
                    ? GestureDetector(
                      onLongPress: () => _showImagePreviewDialog(user),
                      child: Container(
                        width: 120.w,
                        height: 120.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                          image: DecorationImage(
                            image: NetworkImage(user.profileImg!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    : DefaultUserImg(
                      iconSize: 110.sp,
                      containerWidth: 120.w,
                      containerHeight: 120.h,
                    ),

                if (isLoading)
                  Container(
                    width: 120.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 28.w,
                        height: 28.h,
                        child: const CircularProgressIndicator(
                          color: ColorsManager.mainBlue,
                          strokeWidth: 3,
                        ),
                      ),
                    ),
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
        },
      ),
    );
  }
}
