import 'package:echo1/features/profile/screens/echo_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class UserTile extends ConsumerStatefulWidget {
  final PeamanUser user;

  const UserTile({
    super.key,
    required this.user,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserTileState();
}

class _UserTileState extends ConsumerState<UserTile> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(providerOfLoggedInUser);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EchoProfileScreen(user: widget.user);
        }));
      },
      child: ListTile(
        leading: widget.user.photo == null
            ? const PeamanAvatarBuilder.asset(
                "assets/images/avatar_unknown.png",
                package: 'peaman_ui_components',
              )
            : PeamanAvatarBuilder.network(widget.user.photo),
        title: PeamanText.subtitle1(
          widget.user.name,
        ),
        subtitle: PeamanText.caption(
          widget.user.userName,
        ),
        trailing: currentUser.uid != widget.user.uid
            ? PeamanButton.bordered(
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
                onPressed: _onPressedMessage,
              )
            : null,
      ),
    );
  }

  void _onPressedMessage() {
    final uid = ref.read(
      providerOfLoggedInUser.select((value) => value.uid),
    );
    context.pushNamed(
      PeamanChatConversationScreen.route,
      arguments: PeamanChatConversationArgs.byUserIds(
        userIds: [
          widget.user.uid!,
          uid!,
        ]..sort(),
        chatType: PeamanChatType.oneToOne,
      ),
    );
  }
}
