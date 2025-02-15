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
    "private_key_id": "af5f563a9f3ab2a8aa5aed03af81da27a709ef3f",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC4GUG+4EiQZcEl\naA9ly6ntN5olLyiHc7fMKS90pTGjNqp1BkaxoYzQlzi/8aO2l1HFsxvdH2yeEc1C\nDd3RPlb3cFxuf8AkRCGKqglotfK3m+XEowKCepzO4tIHx2L9+3axWZogY8xswMOv\nMc2HdydmN7BfCUrjbADJNX7b6ehCf3UCB6lCdhiQg4s0GzN+t4DnoGjm0whvBJUZ\nUq6cSeXYky1kIWflH1hHkvoDqg1vy2z2lzfe8gwtFXCx30orMuNZYCsdaY6+Ss03\n7y2CvgPGdefGJdLQe+iOp8IvRrbUbJMJuzwV312jlIWnJPLJb1vHEk/PkxgnJToJ\nlpp8+M15AgMBAAECggEABCwFBTuARCQc2OlUnqobYItShxuG+m7WZZ4x+52PaZNL\nEJotpEffcONZv2EipHglu7+1LBvSsnr/y5/p0hyXYZseanNNr49gXTaWPlUP5OD3\nt4Q5gdXKfkETS7wqfkv3uB7U3dK1Jr/Fj3pRneDG4qD0x7/mU7oLrdj0Vi0k/Mts\nauaUuNTCTaNqYSXGPjTnq2a2hhdLcYVo5r7WNq4v+4WUWUdMOiDIkqv93xj4xlsS\nMbAwM8VgpHwuyAvgfSjexoMOuBN/pqAUKLxILFuYcYa9wrTZYOHkzbB7TcokV/nu\nePflkE5e9iAgymKXjYJSi6Bn5QeMMRqVNy5/oqnpwQKBgQDvwMAfiKCD6ommvcqN\n7+Tj0ug4Nw9C5u5P3RqAeWk2hmqPdc0xrSWn9TZobB34DmcFbpBV6Nr4vxll1KgT\nIevRRi+5XeKSqApgjVNS924gOBgUb/LUDDtpcoZAXWpl1vRkBCfwTCIvuJ+nveUF\nVSmxUeavccc/rLFQ7vkwk5dLMQKBgQDEkwMr8UFCws+Dx552Y4+NxfdR2CjchHa5\nuz6mtPq2qwi4ybQbUBOnR6nXTP60IqWcD1RwmwHGM8grkz26843tJn6wlUmcMswG\nXg6yh6y3YR2uxji56/55m8BZLflAc2j+vxHA6HYHtZ70SdOaWpTjx6iQLLWK+KrX\niLHI+aIEyQKBgFATf9fIaVxF/J29bCbGBhv1uGv2L9m3iccQ4SYh5vs4H+U0gkli\nPF6Brx9nZQcRwGT3Dawz7tb/9LqnMU/al4m5OH1gFynGiFjBOyBN1fFa6ugAkAk0\n4K8SejaLPNsw1UWGgdRniU+JCYIcEZ8bV6aK5VKZ3OOuiTav6njIAtMxAoGBAJlg\nV8YujIwJsp6Q34xiLH0jLND4RxGgbX6Hod+zMDfdBYYhI114Qo1v9g4eblGhAvTc\nZTcjSuQaPSH61dyL8n5KXelr4i502ApT00XrZJEEvoNC+LngcAL0ysUKgQOPySmT\nbcfF2Wo0hNz4yZkS+j8r5tLvf4r6cVqQtp8oYAk5AoGARdeI61ds1HsJwP1j9/wM\n06+UkX2EP53o+JZ3VcYGIHLYtQcVMwZQfdcWz9E6hhZanCQx+NrHSEe7Y17+qGPr\nBX4ic1Ei8k1reDggKRDg5IeFsKAhDUJdBH8t1yp/9Q9iwoyUWjhqaw9JCmYhrkWi\n2Zj7961ERemVorhrOSValSs=\n-----END PRIVATE KEY-----\n",
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