import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_saver/file_saver.dart';
import 'package:piximize/utils/utils.dart';

class DownloadButton extends StatelessWidget {
  final Uint8List? compressedImage;
  final String fileName;

  const DownloadButton({
    super.key,
    required this.compressedImage,
    required this.fileName,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: compressedImage != null
          ? () async {
              await FileSaver.instance
                  .saveFile(
                name: fileName,
                bytes: compressedImage!,
                ext: 'jpg', // Change extension based on the image format
              )
                  .then((_) {
                Utils.toastMessage("Image Downloaded Successfully");
              });
            }
          : null,
      icon: Icon(Icons.download),
      label: Text('Download Compressed Image'),
    );
  }
}
