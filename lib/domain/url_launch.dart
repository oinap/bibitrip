import 'package:url_launcher/url_launcher.dart';

Future<bool> willLaunchUrl(String urlString) async {
  Uri url = Uri.parse(urlString);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
    return true;
  } else {
    return false;
  }
}
