import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerArtWidget extends ConsumerWidget {
  const PlayerArtWidget({
    super.key,
    required this.uri,
  });

  final Uri? uri;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: [
            Colors.black.withOpacity(.8),
            Colors.grey.withOpacity(.5),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ).createShader(bounds);
      },
      child: CachedNetworkImage(
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        imageUrl: uri.toString(),
        errorWidget: (context, url, error) => const Center(
          child: Icon(
            Icons.error_outline,
          ),
        ),
      ),
    );
  }
}
