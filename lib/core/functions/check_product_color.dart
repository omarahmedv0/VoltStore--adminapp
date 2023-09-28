import '../constants/colors_manager.dart';

checkProductColor(String colorName) {
    switch (colorName) {
      case 'red':
        return ColorsManager.red;
      case 'black':
        return ColorsManager.black;
      case 'white':
        return ColorsManager.white;
      case 'blue':
        return ColorsManager.blue;
      case 'brown':
        return ColorsManager.brown;
    }
  }
