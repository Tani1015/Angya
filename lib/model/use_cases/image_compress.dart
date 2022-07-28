// 画像圧縮
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';

final imageCompressProvider = Provider<ImageCompress>(
  (_) => throw UnimplementedError(),
);

class ImageCompress {
  ImageCompress(this._tempDirectory);

  final Directory _tempDirectory;

  Future<Uint8List?> call(
          //画像設定
          CroppedFile? file,
          {int quality = 95,
          int minWidth = 1024,
          int minHeight = 1024}) =>
      FlutterImageCompress.compressWithFile(
        file!.path,
        quality: quality,
        minWidth: minWidth,
        minHeight: minHeight,
      );

  Future<File?> callWithPath(
    String path, {
    int quality = 95,
    int minWidth = 1024,
    int minHeight = 1024,
  }) async {
    final directory = Directory(
      //directory/time.jpg
      '${_tempDirectory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg',
    );
    final tempFile = File(directory.path);
    return FlutterImageCompress.compressAndGetFile(
      path,
      tempFile.absolute.path,
      quality: quality,
      minWidth: minWidth,
      minHeight: minHeight,
      format: CompressFormat.jpeg,
    );
  }
}
