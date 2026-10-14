import 'package:flutter/material.dart';
import '../../app/common/constants/direction.dart';

extension DirIcon on Direction {
  IconData get icon {
    switch (this) {
      case Direction.up:
        return Icons.arrow_upward;
      case Direction.down:
        return Icons.arrow_downward;
      case Direction.left:
        return Icons.arrow_back;
      case Direction.right:
        return Icons.arrow_forward;
    }
  }
}

//Extension, zaten var olan bir sınıfa 
//(veya enum’a) onun kodunu değiştirmeden 
//yeni özellik veya fonksiyon eklemek için yazılır.