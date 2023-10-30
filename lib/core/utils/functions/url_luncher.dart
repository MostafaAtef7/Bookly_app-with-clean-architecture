import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> urlLauncher(ctx, String url) async {
  Uri uri = Uri.parse(url);
  if (!await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    ScaffoldMessenger.of(ctx)
        .showSnackBar(const SnackBar(content: Text("Can not launch this Url"),),);
  }
}
