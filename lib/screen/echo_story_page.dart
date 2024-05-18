import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:show_image/show_image.dart';

class EchoMomentScreen extends ConsumerStatefulWidget {
  final int index;
  const EchoMomentScreen({super.key, required this.index});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EchoMomentScreenState();
}

class _EchoMomentScreenState extends ConsumerState<EchoMomentScreen> {
  late PageController _pageController;
  int? currentIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIndex();
  }

  final List<Widget> _stories = List.generate(
    8,
    (index) => Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const SizedBox(
              height: double.infinity,
              width: double.infinity,
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage("assets/images/zoro.jpeg"),
              //     fit: BoxFit.fill,
              //   ),
              // ),
              child: ShowImage(imagePath: "assets/images/zoro1.jpg"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: index == 0
                          ? const AssetImage("assets/images/luffy.jpeg")
                          : null,
                      backgroundColor: index == 0 ? null : AppColor.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "siddhartha$index",
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "2m",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: _stories,
        ),
        GestureDetector(
            onTapDown: (details) {
              final width = MediaQuery.of(context).size.width;
              final tapPosition = details.globalPosition.dx;

              if (tapPosition < width / 2) {
                _onTapLeft();
              } else {
                _onTapRight();
              }
            },
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
            )),
      ],
    );
  }

  getIndex() {
    currentIndex = widget.index;
    _pageController = PageController(initialPage: currentIndex!);
    print(currentIndex);
    setState(() {});
  }

  void _onTapLeft() {
    if (currentIndex! > 0) {
      setState(() {
        currentIndex = currentIndex! - 1;
        _pageController.animateToPage(
          currentIndex!,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _onTapRight() {
    if (currentIndex! < _stories.length - 1) {
      setState(() {
        currentIndex = currentIndex! + 1;
        _pageController.animateToPage(
          currentIndex!,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }
}
