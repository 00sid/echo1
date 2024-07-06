import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class UserTile extends ConsumerWidget {
  final PeamanUser user;
  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: user.photo == null
          ? PeamanAvatarBuilder.asset(
              "assets/images/avatar_unknown.png",
              package: 'peaman_ui_components',
            )
          : PeamanAvatarBuilder.network(user.photo),
      title: PeamanText.subtitle1(
        user.name,
      ),
      subtitle: PeamanText.caption(
        user.userName,
      ),
      trailing: PeamanButton.bordered(
        value: 'Message',
        width: 100.0,
        borderRadius: 10.0,
        padding: const EdgeInsets.all(0.0),
        icon: SvgPicture.asset(
          'assets/svgs/outlined_send_message.svg',
          package: 'peaman_ui_components',
          color: context.isDarkMode
              ? PeamanColors.white70
              : context.theme.colorScheme.primary,
          width: 14.w,
        ),
        onPressed: () {},
      ),
    );
  }
}
