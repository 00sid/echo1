import 'package:audioplayers/audioplayers.dart';
import 'package:echo1/features/commentTest/providers/echo_comments_list_item_provider.dart';
import 'package:echo1/features/commentTest/views/widgets/echo_comments_list.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/comment/extensions/peaman_comment_ext.dart';
import 'package:timeago/timeago.dart';

class EchoCommentsListItem extends ConsumerStatefulWidget {
  /// The list item for the comments.
  const EchoCommentsListItem({
    super.key,
    required this.comment,
  });

  /// The comment to display.
  final PeamanComment comment;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EchoCommentsListItemState();
}

class _EchoCommentsListItemState extends ConsumerState<EchoCommentsListItem> {
  final _borderRadius = 15.0;
  bool isPlaying = false;

  Duration duration = Duration.zero;

  Duration postion = Duration.zero;
  final audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _onInit());
    //listen to states:playing,paused,stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    //listen to audio duration
    audioPlayer.onDurationChanged.listen((d) {
      setState(() {
        duration = d;
      });
    });
    //listen to audio position
    audioPlayer.onPositionChanged.listen((p) {
      setState(() {
        postion = p;
      });
    });
  }

  @override
  void didUpdateWidget(covariant EchoCommentsListItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.comment.isLocal != widget.comment.isLocal) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _handleCreateComment(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _contentBuilder(),
        if (widget.comment.parent == PeamanCommentParent.feed)
          Consumer(
            builder: (context, ref, child) {
              final isRepliesVisible = ref.watch(
                providerOfEchoCommentsListItemProvider(widget.comment.id!)
                    .select((value) => value.isRepliesVisible),
              );
              if (!isRepliesVisible) return const SizedBox();

              return EchoCommentsList.reply(
                feedId: widget.comment.feedId!,
                comment: widget.comment,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              );
            },
          ),
      ],
    ).pB(widget.comment.parent == PeamanCommentParent.feed ? 20.0 : 10.0);
  }

  Widget _contentBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final createCommentState = ref.watch(
          providerOfEchoCommentsListItemProvider(widget.comment.id!)
              .select((value) => value.createEchoCommentState),
        );

        final isLoading = createCommentState.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return Opacity(
          opacity: isLoading ? 0.5 : 1.0,
          child: Row(
            children: [
              if (widget.comment.parent == PeamanCommentParent.comment)
                Transform.flip(
                  flipX: true,
                  child: const Icon(
                    Icons.reply,
                  ),
                ).pL(20.0),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(_borderRadius.spMin),
                    color: PeamanColors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _profileImageBuilder(),
                          SizedBox(
                            width: 10.spMin,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _headerBuilder(),
                                widget.comment.isAudio
                                    ? _audioBuilder()
                                    : _bodyBuilder(),
                                SizedBox(
                                  height: 5.spMin,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ).pad(10.0),
                      _footerBuilder(),
                    ],
                  ),
                ).pX(20.0),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _profileImageBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final commentOwnerFuture = ref.watch(
          providerOfSingleUserByIdFuture(widget.comment.ownerId!),
        );

        return commentOwnerFuture.maybeWhen(
          data: (data) => data.when(
            (success) => PeamanAvatarBuilder.network(
              success.photo,
              userId: success.uid,
              onPressed: () => context.pushNamed(
                PeamanProfileScreen.route,
                arguments: PeamanProfileScreenArgs(
                  userId: success.uid!,
                ),
              ),
              size: 40.0,
            ),
            (failure) => const PeamanAvatarBuilder.network(
              '',
              size: 40.0,
            ),
          ),
          orElse: () => const PeamanAvatarBuilder.network(
            '',
            size: 40.0,
          ),
        );
      },
    );
  }

  Widget _headerBuilder() {
    return Row(
      children: [
        Flexible(
          child: Consumer(
            builder: (context, ref, child) {
              final commentOwnerFuture = ref.watch(
                providerOfSingleUserByIdFuture(widget.comment.ownerId!),
              );

              return commentOwnerFuture.maybeWhen(
                data: (data) => data.when(
                  (success) => PeamanText.body2(
                    success.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  (failure) => const PeamanText.body2(
                    '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                orElse: () => const PeamanText.body2(
                  '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
        if (widget.comment.createdAt != null)
          Container(
            width: 3.spMin,
            height: 3.spMin,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: PeamanColors.grey,
            ),
          ).pX(5.0),
        if (widget.comment.createdAt != null)
          PeamanText.body2(
            format(
              DateTime.fromMillisecondsSinceEpoch(
                widget.comment.createdAt!,
              ),
              locale: 'en_short',
            ),
            style: const TextStyle(
              color: PeamanColors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }

  Widget _bodyBuilder() {
    return PeamanText.body1(
      widget.comment.comment,
      withReadMore: true,
      limit: 100,
      readMoreTextSpace: 4.0,
      readMoreTextStyle: TextStyle(
        color: context.theme.colorScheme.secondary,
        fontWeight: FontWeight.bold,
        fontSize: 12.spMin,
      ),
    );
  }

  Widget _audioBuilder() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade400,
          radius: 18,
          child: IconButton(
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              size: 20,
            ),
            onPressed: () async {
              if (isPlaying) {
                await audioPlayer.pause();
              } else {
                Source source = UrlSource(widget.comment.audioUrl!);
                await audioPlayer.play(source);
              }
            },
          ),
        ),
        Column(
          children: [
            Slider(
                activeColor: Colors.green,
                inactiveColor: Colors.grey,
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: postion.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);
                  await audioPlayer.resume();
                }),
          ],
        ),
        Text(
          formatTime(postion),
        ),
      ],
    );
  }

  Widget _footerBuilder() {
    const isActive = false;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(_borderRadius.spMin),
          bottomRight: Radius.circular(_borderRadius.spMin),
        ),
        color: PeamanColors.extraLightGrey2,
      ),
      child: Consumer(
        builder: (context, ref, child) {
          final createCommentState = ref.watch(
            providerOfEchoCommentsListItemProvider(widget.comment.id!)
                .select((value) => value.createEchoCommentState),
          );
          final isLoading = createCommentState.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );
          if (isLoading) {
            return const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PeamanSpinner(
                  size: 18.0,
                ),
              ],
            ).pXY(10.0, 15.0);
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/outlined_love.svg',
                    package: 'peaman_ui_components',
                    width: 18.spMin,
                    color: isActive
                        ? PeamanColors.midLightGrey
                        : PeamanColors.grey,
                  )
                      .pY(15.0)
                      .pL(10.0)
                      .pR(5.0)
                      .onPressed(_handleLikeButtonPressed),
                  PeamanText.body2(
                    widget.comment.reactionsCount == 1
                        ? '1 like'
                        : '${widget.comment.reactionsCount} likes',
                    style: TextStyle(
                      fontSize: 12.spMin,
                    ),
                  ),
                ],
              ),
              if (widget.comment.parent == PeamanCommentParent.feed)
                Consumer(
                  builder: (context, ref, child) {
                    final isRepliesVisible = ref.watch(
                      providerOfEchoCommentsListItemProvider(widget.comment.id!)
                          .select((value) => value.isRepliesVisible),
                    );

                    return Row(
                      children: [
                        PeamanText.body2(
                          '${widget.comment.repliesCount}',
                          style: TextStyle(
                            fontSize: 12.spMin,
                            color: isRepliesVisible
                                ? PeamanColors.secondary
                                : null,
                          ),
                        ),
                        SizedBox(
                          width: 5.spMin,
                        ),
                        SvgPicture.asset(
                          'assets/svgs/outlined_comment.svg',
                          package: 'peaman_ui_components',
                          width: 18.spMin,
                          color: isRepliesVisible
                              ? PeamanColors.secondary
                              : PeamanColors.grey,
                        ),
                      ],
                    ).pXY(10.0, 15.0).onPressed(_handleRepliesButtonPressed);
                  },
                ),
            ],
          );
        },
      ),
    );
  }

  void _onInit() {
    _handleCreateComment();
  }

  /// Creates a new comment if the comment is local.
  void _handleCreateComment() {
    if (widget.comment.isLocal) {
      // if the comment is local then post the comment to firestore

      // remove the isLocal key from the extra data
      final newExtra = Map<String, dynamic>.from(
        widget.comment.extraData,
      )..remove('is_local');

      ref
          .read(
            providerOfEchoCommentsListItemProvider(
              widget.comment.id!,
            ).notifier,
          )
          // posts the comment to firestore
          .createComment(
            comment: widget.comment.copyWith(
              extraData: newExtra,
            ),
          );
    }
  }

  /// Reacts to the comment.
  void _handleLikeButtonPressed() {
    ref
        .read(
          providerOfEchoCommentsListItemProvider(
            widget.comment.id!,
          ).notifier,
        )
        .reactToComment(
          feedId: widget.comment.feedId!,
          commentId: widget.comment.id!,
          commentOwnerId: widget.comment.ownerId!,
        );
  }

  /// Toggle the visibility of the replies.
  void _handleRepliesButtonPressed() {
    ref
        .read(
          providerOfEchoCommentsListItemProvider(widget.comment.id!).notifier,
        )
        .toggleRepliesVisibility();
  }

  formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
