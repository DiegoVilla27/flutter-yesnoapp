import 'package:flutter/material.dart';

/// A stateless widget that displays an image from a network URL.
/// 
/// The image is clipped with rounded corners and has a fixed height of 150 pixels.
/// If the image is loading, a placeholder text 'Receiving image...' is shown.
/// 
/// The [url] parameter specifies the network URL of the image to display.
class ImageMessage extends StatelessWidget {
  final String? url;

  const ImageMessage({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        url ?? '',
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          return (loadingProgress == null) ? child : Text('Receiving image...');
        },
      ),
    );
  }
}
