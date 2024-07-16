import 'dart:math';

import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

Future<List<Color>> generateMeshGradientFromImage(ImageProvider image) async {
  // await Future.delayed(const Duration(seconds: 1));
  final paletteGenerator = await PaletteGenerator.fromImageProvider(
    image,
    maximumColorCount: 4,
  );

  final meshColors = paletteGenerator.colors.toList();

  while (meshColors.length < 4) {
    // Choose a random color from the meshColors list
    final random = Random();
    final randomColor = meshColors[random.nextInt(meshColors.length)];
    meshColors.add(randomColor);
  }

  return meshColors;
}
