import 'package:url_launcher/url_launcher.dart';

void launchURL(String link) async {
  final Uri url = Uri.parse('https://jikan.moe');

  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
