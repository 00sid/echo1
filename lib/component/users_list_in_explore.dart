import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class UsersInExplore extends ConsumerWidget {
  const UsersInExplore({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allUsers = ref.watch(providerOfPeamanFollowersStream);

    print(allUsers.value);
    return ListView.builder(
        itemCount: allUsers.value!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              allUsers.value![index].uid.toString(),
            ),
          );
        });
  }
}
