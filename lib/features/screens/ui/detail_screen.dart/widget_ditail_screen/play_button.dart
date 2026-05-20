import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlayButton extends StatelessWidget {
  final String? youtubeUrl;

  const PlayButton({super.key, this.youtubeUrl});

  Future<void> launchUrlFunction() async {
    if (youtubeUrl != null && youtubeUrl!.isNotEmpty) {
      final Uri uri = Uri.parse(youtubeUrl!);
      if (!await launchUrl(uri, mode: LaunchMode.inAppBrowserView)) {
        throw Exception('Could not launch $uri');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 280,
      right: 30,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: const Color(0xffF05C23),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xffF05C23).withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: IconButton(
          onPressed: () {
            launchUrlFunction();
          },
          icon: const Icon(Icons.play_arrow, color: Colors.white, size: 35),
        ),
      ),
    );
  }
}
