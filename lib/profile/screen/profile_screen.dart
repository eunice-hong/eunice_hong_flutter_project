import 'package:eunice_repository/repository.dart';
import 'package:eunice_template/gen/assets.gen.dart';
import 'package:eunice_template/l10n/l10n.dart';
import 'package:eunice_template/profile/bloc/cubit/profile_cubit.dart';
import 'package:eunice_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(
        profileRepository: GetIt.I<ProfileRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(context.l10n.appTitle)),
        body: const Center(
          child: Child(),
        ),
      ),
    );
  }
}

class Child extends StatelessWidget {
  const Child({super.key});

  @override
  Widget build(BuildContext context) {
    final isToggleOn = context.select(
      (ProfileCubit testCubit) => testCubit.state,
    );
    var appNameText = '';
    if (isToggleOn) {
      appNameText = context.l10n.appTitle;
    }
    return Container(
      margin: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          children: [
            IconButton(
              iconSize: 200,
              onPressed: () async {
                await context
                    .read<ProfileCubit>()
                    .setProfile(isOn: !isToggleOn);
              },
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Assets.images.drawable.projectLogo.image(
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(appNameText, style: AppTextStyle.headline1),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => _openLink(
                    'https://www.instagram.com/dev.driven.eunice',
                  ),
                  icon: Assets.images.icons.instagram.image(
                    color: AppColors.seaSerpent,
                  ),
                  color: AppColors.seaSerpent,
                  iconSize: 32,
                ),
                IconButton(
                  onPressed: () => _openLink(
                    'https://github.com/eunice-hong',
                  ),
                  icon: Assets.images.icons.github.image(
                    color: AppColors.seaSerpent,
                  ),
                  color: AppColors.seaSerpent,
                  iconSize: 32,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Assets.images.icons.linkedin.image(
                    color: AppColors.seaSerpent,
                  ),
                  color: AppColors.seaSerpent,
                  iconSize: 32,
                ),
                IconButton(
                  onPressed: () => _openLink(
                    'https://eunice-hong.com/',
                  ),
                  icon: const Icon(
                    Icons.link_outlined,
                    color: AppColors.seaSerpent,
                  ),
                  iconSize: 32,
                ),
              ],
            )
          ],
        ),
      ),
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
