import 'package:echo1/screen/echo_story_page.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MomentProfileBox extends StatelessWidget {
  final int index;
  bool isSeen;
  MomentProfileBox({super.key, required this.index, this.isSeen = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTapDown: (details) {
                _navigateToDetailScreen(context, details.globalPosition);
              },
              child: Container(
                margin: EdgeInsets.only(right: 5, left: index == 0 ? 10 : 0),
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: index == 0 ? null : Colors.grey,
                  shape: BoxShape.circle,
                  image: index == 0
                      ? const DecorationImage(
                          image: AssetImage(
                            "assets/images/luffy.jpeg",
                          ),
                          scale: 1)
                      : null,
                  border: Border.all(
                    color: isSeen ? AppColor.white : AppColor.brightGreen,
                    width: 2,
                  ),
                ),
              ),
            ),
            index == 0
                ? Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Center(
                        child: Icon(
                          Icons.add,
                          size: 33,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        Text(
          index == 0 ? "Your Story" : "User $index",
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  void _navigateToDetailScreen(BuildContext context, Offset tapPosition) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            EchoMomentScreen(
          index: index,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final screenSize = MediaQuery.of(context).size;

          final tappedX = tapPosition.dx / screenSize.width;
          final tappedY = tapPosition.dy / screenSize.height;

          return Stack(
            children: [
              Positioned.fill(
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(
                      tappedX * screenSize.width,
                      tappedY * screenSize.height,
                    )
                    ..scale(animation.value)
                    ..translate(
                      -tappedX * screenSize.width,
                      -tappedY * screenSize.height,
                    ),
                  child: child,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
