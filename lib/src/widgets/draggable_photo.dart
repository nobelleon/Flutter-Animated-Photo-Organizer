import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DraggablePhoto extends StatelessWidget {
  final int index;

  const DraggablePhoto({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final photoProvider = Provider.of<PhotoProvider>(context);
    final photo = photoProvider.photos[index];
    return LongPressDraggable<int>(
      data: index,
      feedback: Material(
        child: Image.asset(
          photo,
          fit: BoxFit.fitHeight,
          width: 170,
          height: 220,
        ),
      ),
      childWhenDragging: Container(),
      child: DragTarget<int>(
        builder: (context, candidateData, rejectedData) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Image.asset(
              photo,
              key: ValueKey(photo),
              fit: BoxFit.cover,
            ),
          );
        },
        onAcceptWithDetails: (fromIndex) {
          photoProvider.swapPhotos(fromIndex.data, index);
        },
      ),
    );
  }
}

class PhotoProvider with ChangeNotifier {
  final List<String> _photos = [
    'assets/img/nature1.jpg',
    'assets/img/nature2.jpg',
    'assets/img/nature3.jpg',
    'assets/img/nature4.jpg',
    'assets/img/nature5.jpg',
    'assets/img/nature6.jpg',
    'assets/img/nature7.jpg',
    'assets/img/nature8.jpg',
    'assets/img/nature9.jpg',
    'assets/img/manga1.jpg',
    'assets/img/manga2.jpg',
    'assets/img/manga3.jpg',
    'assets/img/manga4.jpg',
    'assets/img/manga5.jpg',
    'assets/img/manga6.jpg',
    'assets/img/manga7.jpg',
    'assets/img/manga8.jpg',
    'assets/img/manga9.jpg',
    'assets/img/manga10.jpg',
    'assets/img/manga11.jpg',
    'assets/img/manga12.jpg',
    'assets/img/manga13.jpg',
    'assets/img/manga14.jpg',
    'assets/img/manga15.jpg',
  ];

  List<String> get photos => _photos;

  void swapPhotos(int fromIndex, int toIndex) {
    final photo = _photos.removeAt(fromIndex);
    _photos.insert(toIndex, photo);
    notifyListeners();
  }
}
