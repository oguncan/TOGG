import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

launchURL(String url) async {
  final encodedUrl = Uri.encodeFull(url);
  if (await canLaunchUrlString(encodedUrl)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}