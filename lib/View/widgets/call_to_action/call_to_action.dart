import 'package:flutter/material.dart';
import 'package:investment/View/widgets/call_to_action/call_to_action_mobile.dart';
import 'package:investment/View/widgets/call_to_action/call_to_action_tablet_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CallToAction extends StatelessWidget {
  final String title;
  final String navigationPath;
  const CallToAction(this.title, this.navigationPath,);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: CallToActionMobile(title,navigationPath),
      desktop: CallToActionTabletDesktop(title, navigationPath)
    );
  }
}