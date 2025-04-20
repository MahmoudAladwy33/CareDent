import 'package:flutter/material.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/text_styless.dart';

Future<bool?> showDeleteConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder:
        (context) => AlertDialog(
          backgroundColor: ColorsManager.lightGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(Icons.delete_outline, color: Colors.red, size: 28),
              const SizedBox(width: 8),
              Text(
                "Delete Appointment",
                style: TextStyles.font24DarkBlueExtraBold.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: const Text(
            "Are you sure you want to delete this appointment?",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: ColorsManager.darkBlue,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                "Delete",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
  );
}
