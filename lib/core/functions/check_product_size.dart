
  String checkProductSize(String sizeName) {
    switch (sizeName) {
      case 'large':
        return 'L';
      case 'medium':
        return 'M';
      default:
        return 'S';
    }
  }