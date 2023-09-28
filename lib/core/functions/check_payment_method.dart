  String checkPaymentOrder(String val) {
    switch (val) {
      case 'cash':
        return 'Cash on Delivery';
      default:
        return 'Payment Card';
    }
  }