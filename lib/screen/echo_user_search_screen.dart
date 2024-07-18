import 'package:echo1/providers/explore/explore_provider.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class EchoUserSearchScreen extends ConsumerStatefulWidget {
  @override
  _EchoUserSearchScreenState createState() => _EchoUserSearchScreenState();
}

class _EchoUserSearchScreenState extends ConsumerState<ConsumerStatefulWidget> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Use WidgetsBinding.instance.addPostFrameCallback to ensure the focus request
    // is made after the widget tree is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final usersAsyncValue = ref.watch(providerOfUsers);

    return Scaffold(
      appBar: _appBar(context),
      body: usersAsyncValue.when(
        data: (users) {
          final filteredUsers = users
              .where(
                (user) =>
                    user.userName!.toLowerCase().contains(
                          _searchController.text.toLowerCase().trim(),
                        ) ||
                    user.name!.toLowerCase().contains(
                          _searchController.text.toLowerCase().trim(),
                        ),
              )
              .toList();

          return _searchController.text.trim().isEmpty
              ? Container()
              : filteredUsers.isEmpty
                  ? const Center(
                      child: Text("No user found"),
                    )
                  : ListView.builder(
                      itemCount: filteredUsers.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              PeamanProfileScreen.route,
                              arguments: PeamanProfileScreenArgs(
                                userId: filteredUsers[index].uid!,
                              ),
                            );
                          },
                          child: _userTile(
                            user: filteredUsers[index],
                            context: context,
                          ),
                        );
                      },
                    );
        },
        error: (error, value) {
          return PeamanErrorBuilder(
            subTitle: value.toString(),
          );
        },
        loading: () {
          return const PeamanSpinner();
        },
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: Center(
        child: PeamanRoundIconButton(
          padding: EdgeInsets.all(7.w),
          onPressed: context.pop,
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 16.w,
          ),
        ),
      ),
      title: TextField(
        controller: _searchController,
        focusNode: _focusNode,
        decoration: InputDecoration(
          hintText: "Search user",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _searchController.text.trim().isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    _searchController.clear();
                    setState(() {});
                  },
                  child: const Icon(Icons.clear),
                )
              : null,
        ),
        onChanged: (val) {
          setState(() {});
        },
      ),
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
