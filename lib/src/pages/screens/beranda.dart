import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/draggable_photo.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    final photoProvider = Provider.of<PhotoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
        ),
        itemCount: photoProvider.photos.length,
        itemBuilder: (context, index) {
          return DraggablePhoto(
            index: index,
          );
        },
      ),
    );
  }
}
