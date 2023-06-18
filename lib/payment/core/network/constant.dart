class ApiContest {
  static const String baseUrl = 'https://accept.paymob.com/api';
  static const String paymentApiKey =
      "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TnpRMU5ERTJMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuZnJpN21mRFBlbkNobmVGaDM2YU5rNUJDSzY3RnJfS1Y0NG5IQlA4bTM1WWQtcTlrSTcwa19id3lzMEh2bExVajJWdHEybks0VERBbWdmTnFqbHFDc1E=";
  static const String getAuthToken = '/auth/tokens';
  static const getOrderId = '/ecommerce/orders';
  static const getPaymentRequest = '/acceptance/payment_keys';
  static const getRefCode = '/acceptance/payments/pay';
  static String visaUrl =
      '$baseUrl/acceptance/iframes/753361?payment_token=$finalToken';

  //acceptance/iframes/?payment_token={payment_key_obtained_previously}
  static String paymentFirstToken = '';

  static String paymentOrderId = '';

  static String finalToken = '';

  static const String integrationIdCard = '3736904';
  static const String integrationIdKiosk = '3740797';

  static String refCode = '';
}

class AppImages {
  static const String refCodeImage =
      "https://cdn-icons-png.flaticon.com/128/4090/4090458.png";
  static const String visaImage =
      "https://cdn-icons-png.flaticon.com/128/349/349221.png";
}
