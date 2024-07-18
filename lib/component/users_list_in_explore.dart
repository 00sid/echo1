import 'package:echo1/features/profile/screens/echo_profile_screen.dart';
import 'package:echo1/providers/explore/explore_provider.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class UsersInExplore extends ConsumerStatefulWidget {
  const UsersInExplore({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UsersInExploreState();
}

class _UsersInExploreState extends ConsumerState<UsersInExplore> {
  @override
  Widget build(BuildContext context) {
    final usersAsyncValue = ref.watch(providerOfUsers);
    final uid = ref.watch(
      providerOfLoggedInUser.select((value) => value.uid),
    );

    return usersAsyncValue.when(
      data: (users) {
        return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return uid == users[index].uid
                  ? const SizedBox()
                  : GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pushNamed(
                        //   PeamanProfileScreen.route,
                        //   arguments: PeamanProfileScreenArgs(
                        //     userId: users[index].uid!,
                        //   ),
                        // );
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return EchoProfileScreen(user: users[index]);
                        }));
                      },
                      child: SizedBox(
                        height: 73.0,
                        child: Column(
                          children: [
                            //user tile
                            _userTile(
                              user: users[index],
                              context: context,
                            ),
                            Divider(
                              color: Colors.grey.shade400,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    );
            });
      },
      error: (error, value) {
        return PeamanErrorBuilder(
          subTitle: value.toString(),
        );
      },
      loading: () {
        return const PeamanSpinner();
      },
    );
  }

  Widget _userTile({required PeamanUser user, required BuildContext context}) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.bottomRight,
        children: [
          user.photo != null
              ? CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(
                    user.photo!,
                  ),
                )
              : const CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage(
                    'assets/images/avatar_unknown.png',
                    package: 'peaman_ui_components',
                  ),
                ),
          user.isVerified
              ? const PeamanVerifiedBadge().pL(16.0)
              : const SizedBox(),
        ],
      ),
      title: Text(
        user.userName!,
        style: TextStyle(
          color: context.isDarkMode ? AppColor.white : AppColor.black,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        user.name!,
        style: TextStyle(
          color: context.isDarkMode ? AppColor.white : AppColor.black,
          fontSize: 14.0,
        ),
      ),
    );
  }
}
