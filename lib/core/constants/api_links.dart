class ApiLinks {
  // static const _baseUrl = 'http://10.0.2.2/e-commerce-app';
  static const _baseUrl = 'http://192.168.1.9/e-commerce-app';

  //------------------------- IMAGES------------------------
  static const categoriesImageLink = '$_baseUrl/upload/categories';
  static const bannersImageLink = '$_baseUrl/upload/banners';
  static const productsImagesLink = '$_baseUrl/upload/products';
  static const notificationsImagesLink = '$_baseUrl/upload/notify';
  static const profileImagesLink = '$_baseUrl/upload/userprofile';
  static const onboardingImage = '$_baseUrl/upload/onboarding';

  //------------------------- AUTH------------------------
  static const loginLink = '$_baseUrl/admin/auth/login.php';

  //------------------------- categories------------------------
  static const getCategories = '$_baseUrl/admin/categories/get_categories.php';
  static const addCategories = '$_baseUrl/admin/categories/add.php';
  static const editCategories = '$_baseUrl/admin/categories/edit.php';
  static const deleteCategories = '$_baseUrl/admin/categories/delete.php';
  //------------------------- products------------------------
  static const getProducts = '$_baseUrl/admin/products/get_products.php';
  static const addProducts = '$_baseUrl/admin/products/add.php';
  static const editProducts = '$_baseUrl/admin/products/edit.php';
  static const deleteProducts = '$_baseUrl/admin/products/delete.php';
  static const getProductColor = '$_baseUrl/products/get_colors.php';
  static const getProductSize = '$_baseUrl/products/get_size.php';

  //------------------------- orders------------------------
  static const getOrdersPending =
      '$_baseUrl/admin/orders/get_orders_pending.php';
  static const getOrdersPrepared =
      '$_baseUrl/admin/orders/get_orders_being_prepared.php';
  static const getOrdersDelivery =
      '$_baseUrl/admin/orders/get_orders_with_delivery.php';
  static const getOrdersReceived =
      '$_baseUrl/admin/orders/get_orders_received.php';
  static const approveOrder = '$_baseUrl/admin/orders/approval.php';
  static const preparedOrder = '$_baseUrl/admin/orders/prepare_done.php';
  static const cancelOrder = '$_baseUrl/admin/orders/cancel.php';
  static const getDeliveryID = '$_baseUrl/admin/orders/get_deliveryid.php';
  static const getOrderDetails = '$_baseUrl/admin/orders/get_order_details.php';
  static const getCities = '$_baseUrl/address/get_cities.php';
  //------------------------- Accounts------------------------
  static const getAdminAccount =
      '$_baseUrl/admin/accounts/admins/get_admins_data.php';
  static const getDeliveriesAccount =
      '$_baseUrl/admin/accounts/deliveries/get_deliveries_data.php';
  static const addAdminAccount = '$_baseUrl/admin/accounts/admins/add.php';
  static const addDeliveriesAccount =
      '$_baseUrl/admin/accounts/deliveries/add.php';
  static const editDeliveryAccount =
      '$_baseUrl/admin/accounts/deliveries/edit.php';
  static const editAdminAccount =
      '$_baseUrl/admin/accounts/admins/edit.php';
  static const deleteAdminAccount = '$_baseUrl/admin/accounts/admins/delete.php';
  static const deleteDeliveriesAccount =
      '$_baseUrl/admin/accounts/deliveries/delete.php';

  //------------------------- Cities------------------------
  static const addCity = '$_baseUrl/admin/cities/add.php';
  static const editCity = '$_baseUrl/admin/cities/edit.php';
  static const deleteCity = '$_baseUrl/admin/cities/delete.php';

  //------------------------- Shipping cost------------------------
  static const getShippingCostData = '$_baseUrl/admin/shipping_cost/get_shipping_cost.php';
  static const getCitiesData = '$_baseUrl/admin/shipping_cost/get_cities.php';
  static const addShippingCost = '$_baseUrl/admin/shipping_cost/add.php';
  static const deleteShippingCost = '$_baseUrl/admin/shipping_cost/delete.php';

  //------------------------- Coupons------------------------
  static const getCoupons = '$_baseUrl/admin/coupons/get_coupons.php';
  static const addCoupon = '$_baseUrl/admin/coupons/add.php';
  static const deleteCoupon = '$_baseUrl/admin/coupons/delete.php';
}
