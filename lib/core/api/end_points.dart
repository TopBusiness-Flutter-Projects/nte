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

  static const String getProfile = '${baseUrl}auth/getProfile';
}
