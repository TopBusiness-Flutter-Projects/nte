class EndPoints {
  static const String baseUrl = 'https://nte.topbusiness.io/api/';
  static const String loginUrl = '${baseUrl}auth/login';
  static const String registerUrl = '${baseUrl}auth/register';
  static const String citiesUrl = '${baseUrl}cities';
  static const String checkPhone = '${baseUrl}checkPhone';
  static const String resetPassword = '${baseUrl}resetPassword';
  static const String ordersCompleted = '${baseUrl}orders/ordersCompleted';
  static const String ordersNotCompleted =
      '${baseUrl}orders/ordersNotCompleted';
  static const String deleteOrder = '${baseUrl}orders/deleteOrder/';

  static const String orderDetails = '${baseUrl}orders/orderDetail/';
  static const String updateOrder = '${baseUrl}orders/updateOrder/';

  static const String getProfile = '${baseUrl}auth/getProfile';

  static const String updateProfile = '${baseUrl}auth/updateProfile';
  static const String allPlaces = '${baseUrl}orders/getAllPlaces';
  static const String addOrder = '${baseUrl}orders/addNewOrder';
  static const String deleteAccount = '${baseUrl}auth/deleteAccount';
  static const String changePass = '${baseUrl}auth/changePassword';
  static const String completedOrderDriver =
      '${baseUrl}driver/orders/allOrdersCompletedPayment';
  static const String orderDriverDetails =
      '${baseUrl}driver/orders/orderDetail/';
  static const String allOrdersDriver =
      '${baseUrl}driver/orders/allOrdersOfDriver?search=';
  static const String changeStatusOrdersDriver =
      '${baseUrl}driver/orders/changeOrderStatus/';
  static const String setting = '${baseUrl}setting';

  ///setting
}
