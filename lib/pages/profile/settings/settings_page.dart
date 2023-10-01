import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/common/values/constant.dart';
import 'package:ulearning/pages/application/bloc/app_blocs.dart';
import 'package:ulearning/pages/application/bloc/app_events.dart';
import 'package:ulearning/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:ulearning/pages/profile/settings/bloc/settings_states.dart';
import 'package:ulearning/pages/profile/settings/widgets/settings_widgets.dart';

import '../../../global.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  // for logout
  void removeUserData(){
    //for resetting the app state for page to start form home
    context.read<AppBlocs>().add(const TriggerAppEvent(0));
    // removing user data from the app to logout
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    // retuning for the singin page
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN,
            (route) => false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
          child: BlocBuilder<SettingsBlocs, SettingsStates>(
        builder: (context, state) {
          return Container(
            child: Column(
              children: [
                settingsButton(context, removeUserData),
              ],
            ),
          );
        },
      )),
    );
  }
}
