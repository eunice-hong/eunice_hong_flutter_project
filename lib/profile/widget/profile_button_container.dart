import 'package:eunice_template/gen/assets.gen.dart';
import 'package:eunice_ui/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

part 'profile_button.dart';

class ProfileButtonContainer extends StatelessWidget {
  const ProfileButtonContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileButton(
          onPressed: () => _openLink(
            'https://www.instagram.com/dev.driven.eunice',
          ),
          icon: Assets.images.icons.instagram.image(
            color: AppColors.seaSerpent,
          ),
        ),
        ProfileButton(
          onPressed: () => _openLink(
            'https://github.com/eunice-hong',
          ),
          icon: Assets.images.icons.github.image(
            color: AppColors.seaSerpent,
          ),
        ),
        ProfileButton(
          onPressed: () {},
          icon: Assets.images.icons.linkedin.image(
            color: AppColors.seaSerpent,
          ),
        ),
        ProfileButton(
          onPressed: () => _openLink(
            'https://eunice-hong.com/',
          ),
          icon: const Icon(
            Icons.link_outlined,
            color: AppColors.seaSerpent,
          ),
        ),
      ],
    );
  }

  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
