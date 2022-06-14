import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:zendo_mobile/app/core/utils/toast.dart';
import 'package:zendo_mobile/app/core/values/constants.dart';

class ShareUtil {
  static void contactAdmin() async {
    final whatsappUrlAndroid = Uri.parse("whatsapp://send?phone=$adminPhone");
    final whatsappUrlIOS = Uri.parse("https://api.whatsapp.com/send/?phone=$adminPhone");

    if (Platform.isIOS) {
      if (await canLaunchUrl(whatsappUrlIOS)) {
        await launchUrl(whatsappUrlIOS, mode: LaunchMode.externalApplication);
      } else {
        ToastUtil.showDefault("Whatsapp tidak ditemukan");
      }
    } else {
      if (await canLaunchUrl(whatsappUrlAndroid)) {
        await launchUrl(whatsappUrlAndroid);
      } else {
        ToastUtil.showDefault("Whatsapp tidak ditemukan");
      }
    }
  }
}
