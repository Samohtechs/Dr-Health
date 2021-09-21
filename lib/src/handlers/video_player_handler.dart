// @dart=2.12

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  final assetFile;
  MyVideoPlayer({Key? key, this.assetFile}) : super(key: key);

  @override
  _MyVideoPlayer createState() => _MyVideoPlayer();
}

class _MyVideoPlayer extends State<MyVideoPlayer> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(widget.assetFile)
    ..addListener(() => setState(() {}))
    ..initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: _videoController.value.isInitialized ? _buildVideoPlayerUI() : const CircularProgressIndicator(),
    );
  }

  Widget _buildVideoPlayerUI() {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        AspectRatio(
          aspectRatio: _videoController.value.aspectRatio,
          child: VideoPlayer(_videoController),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => _videoController.value.isPlaying ? _videoController.pause() : _videoController.play(),
              child: Icon(_videoController.value.isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.greenAccent),
            ),
            VideoProgressIndicator(_videoController, allowScrubbing: true, colors: VideoProgressColors( playedColor: Colors.greenAccent)),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }
}
