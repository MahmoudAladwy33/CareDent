import 'package:caredent/features/settings/ui/widgets/custom_settings_app_bar.dart';
import 'package:caredent/features/settings/ui/widgets/settings_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class SettingsScreenBody extends StatelessWidget {
  const SettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [CustomSettingsAppBar(), SettingsList()]),
      ),
    );
  }
}
