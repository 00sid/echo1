import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class EchoFeedScreen extends ConsumerStatefulWidget {
  const EchoFeedScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EchoFeedScreenState();
}

class _EchoFeedScreenState extends ConsumerState<EchoFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return PeamanTimelineFeedsScreen(
      headerBuilder: (context, ref) {
        return PeamanTimelineFeedsScreenHeader(
          title: PeamanText.heading4(
            'Echo',
            style: GoogleFonts.caveat(),
          ),
        );
      },
    );
  }
}
