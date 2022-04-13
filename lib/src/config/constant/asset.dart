import 'dart:ui' as ui;
import 'package:image/image.dart' as lib;
import 'dart:typed_data';
import 'package:flutter/services.dart';

class Asset {
  const Asset._();
  static const audio = _AudioAsset();
  static const svg = _SvgAsset();
  static const image = _ImageAsset();
  //ByteData opetaions
  static Future<ByteData> loadImage() async {
    ByteData data = await rootBundle.load('assets/image/octopus.png');
    return data;
  }

  static Future<ui.Image> byteToUiImage(ByteData data) async {
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }

  static Future<lib.Image?> byteToLibImagePng(ByteData data) async {
    return lib.decodePng(data.buffer.asUint8List());
  }

  static Uint8List byteToInt8List(ByteData data) {
    return data.buffer.asUint8List();
  }
// Uint8list opeations

  static Future<ui.Image> int8ListToUiImage(Uint8List list) async {
    final codec = await ui.instantiateImageCodec(list);
    final frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }

  static Future<lib.Image?> int8ListToLibImage(Uint8List list) async {
    return lib.decodePng(list);
  }

//Cross Operation
  static Future<ui.Image> imgImageToUiImage(lib.Image image) async {
    ui.ImmutableBuffer buffer = await ui.ImmutableBuffer.fromUint8List(
        image.getBytes(format: lib.Format.rgba));
    ui.ImageDescriptor id = ui.ImageDescriptor.raw(buffer,
        height: image.height,
        width: image.width,
        pixelFormat: ui.PixelFormat.rgba8888);
    ui.Codec codec = await id.instantiateCodec(
        targetHeight: image.height, targetWidth: image.width);
    ui.FrameInfo fi = await codec.getNextFrame();
    ui.Image uiImage = fi.image;
    return uiImage;
  }
}

class _SvgAsset {
  const _SvgAsset();
  final logo = 'assets/svg/logo.svg';
  final deleteIcon = 'assets/svg/del.svg';
  final illustration = 'assets/svg/illustration.svg';
  final chemistryLab = 'assets/svg/chemistry_lab.svg';
}

class _ImageAsset {
  const _ImageAsset();
  final String shapes = 'assets/images/shapes.png';
  final String baloonBg = 'assets/images/baloon_bg.png';
  final String child = 'assets/images/child.png';
  final String boyGirl1 = 'assets/images/boy_girl_1.png';
  final String logo = "assets/images/logo.png";
  final String ball = "assets/images/ball_2.png";
  final String clock = "assets/images/clock_2.png";
  final String woodenTile = "assets/images/wooden_bg_tile.jpg";
}

class _AudioAsset {
  const _AudioAsset();

  final String gameOver = 'assets/audio/game_over.mp3';
  final String gameWin = 'assets/audio/game_win.mp3';
  final String gameStart = 'assets/audio/game_start.mp3';
  final String reject = 'audio/reject.wav';
  final String match = 'audio/match.wav';
}
