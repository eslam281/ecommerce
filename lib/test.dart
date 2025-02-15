import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

import 'core/services/services.dart';

// Cached client

Future<String?> getAccessToken() async {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("accesstoken") == null) {

  final serviceAccountJson = {
    "type": "service_account",
    "project_id": "ecommerce-d0db2",
    "private_key_id": "b9b881910c3ebebcbed34975bdfec95951b1fb91",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDFTJjYN64YY/bO\njK0/x/65b62NEkT4hZIBSRuqtGx5sOhz9giDbl5yIWr3UFkRMFMvZ+7chS2PMqCe\ne+hYCRduYYFV54C2FlhIYRwIgJIA9tla9LGot7Q73Yr/63Dt1IB6mINFxn5gj5WH\n8CYJdbeb1+bUaZ7+q9cBr0hPyu6JCchCeFlZv+eaYgjET8do53bZc6u2DU/qdvXK\nw3fwqoysGsoJwmLY2C6+mtrXalbACLoqxBKR2uPZX/bMquLvAWwxOSjdytoMiwOS\njk3HPzIotJGVm/n5MGB51aiQhzVFE1SIi+MvvV9iS4Rurc0ftsvsOa2p0Hg6wF5+\n9MFY9zF/AgMBAAECggEAAg05W6o8j7leZCh3Vr30KqZ8JgbmG7V73rKNbJmCtUM/\nL5GD5iX8KnCphZfazUB05P3OMJHb9uy+WdeNA3lYuoeeCjAlmP8jfOExou7/Va47\ndWQtAsWiRKsZmm6u1nJKwbubRdr6DnP/yJGZO6jzN1Yn6taMVjagPj694EKKd3dT\nYJKTElHtQDztb7TQgO8B1Qp6C0OOj2YApXnS1ZBwrY+daATQLx/UD0RLIm3ospPA\nzOtkEWslmA3DpJJi3jlhjqEGkQC6lVKckKCYobntOCFdpVYBBJIvq+xjjoUptr4p\n2trl7ZJWL54feqyd9XXTAgLyoVhw9hbltCIdxbmgyQKBgQD4sssWFr2A0c+Z9ffy\n9pNg0UBb4DZfMcAWdkCYxRWGOwVNuC4txT9hYAnHPedDOhIHZAL0Fr/d9PuzAS6D\nMPumgC0sOpMj53anPl53UulJoOmRnRZeQP//M0Kvm/uSXG8+lOttJMhquXTuVsfd\nk6ZHagQ3FjWNy04EnSZTtYTJRwKBgQDLF31QcueENaEEcvfGRE7qQG5BeHRmgIhG\no8hv1aUWN+BYNPKa5iO4fEwu8BTHFdpiIucQRy+tuo+T3kHL4r3rQILN3AQ3WKg3\nzUVW/ZxclRinbmrOBv9Ef3YONpNv21oMLZGEVBuMz8n3ReDQhxMoudINeXid+w0B\naCp++kHyCQKBgQCQE4yB5HSuf15EtHGLiPvCeBdP4qm9JmZA3Qr5NhwNIn4lE1F1\nZLMeJ3QiwCMNGEQ/kdoALHnFDVsPzdxzVlpDkDgbSmfZwgtEQmaZvCe4ZwdJO3cs\n7X0hDEJS2Au7M9+iosVs+oU9BunN9epd3F7VOn7spuopliFBnQUKM7uUmwKBgFdL\nr3fHDDDOBHovGMXGUs1qCHpn1lDA6tLCT8OSZ7WXKv1/NNDUH4KLGwwJ8kRo5kfM\njNl4X8wjJtf+bvW+brgSMKdf7QgFOblSqH1t4aoCBGjjk1EfvNWqnAob91/bP2eA\nps3kgTsTjdKV3L6FcPzOcrWMAwaVBNAYADw4QeRRAoGAepNMOi/KIgK6EhmoBDIw\ncH2cezUC5std/9t68Wuqp8CgY/j/Ife4vSnssXRAtSCKdJa3hClzjZRTeoF/VJtM\nBz6UmgbPtdC4EIMZAazAOIQeE/ykcD8hi8nLMh8Yx5jEKFcXGg7AcP3TRXFd5RJD\nmbgzc+i0J/ZTl0KvHHKvgaM=\n-----END PRIVATE KEY-----\n",
    "client_email": "firebase-adminsdk-mf3n2@ecommerce-d0db2.iam.gserviceaccount.com",
    "client_id": "111310430108892448806",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-mf3n2%40ecommerce-d0db2.iam.gserviceaccount.com",
    "universe_domain": "googleapis.com"
  };

  List<String> scopes = [
    "https://www.googleapis.com/auth/userinfo.email",
    "https://www.googleapis.com/auth/firebase.database",
    "https://www.googleapis.com/auth/firebase.messaging"
  ];

    try {
      http.Client client = await auth.clientViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

      auth.AccessCredentials credentials =
      await auth.obtainAccessCredentialsViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
          scopes, client);

      client.close();
      print("Access Token: ${credentials.accessToken.data}"); // Print Access Token
      myServices.sharedPreferences.setString("accesstoken", credentials.accessToken.data);
      return credentials.accessToken.data;
    } catch (e) {
      print("Error getting access token: $e");
      return "";
    }
  }
  return myServices.sharedPreferences.getString("accesstoken");
}