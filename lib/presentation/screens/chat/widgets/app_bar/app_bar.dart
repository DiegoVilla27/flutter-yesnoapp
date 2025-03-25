import 'package:flutter/material.dart';

/// A custom chat app bar widget that displays a leading circle avatar
/// with a network image and a title.
/// 
/// Implements [PreferredSizeWidget] to define the preferred size of the app bar.
class AppBarChat extends StatelessWidget implements PreferredSizeWidget {
  const AppBarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://www.zonanegativa.com/imagenes/2024/09/batman-day.jpg',
          ),
        ),
      ),
      title: Text('Diego Villa'),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
