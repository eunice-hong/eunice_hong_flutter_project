import 'package:eunice_template/gen/assets.gen.dart';
import 'package:eunice_template/l10n/l10n.dart';
import 'package:eunice_template/profile/bloc/cubit/profile_cubit.dart';
import 'package:eunice_template/profile/widget/profile_button_container.dart';
import 'package:eunice_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

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
            const ProfileButtonContainer(),
          ],
        ),
      ),
    );
  }
}
