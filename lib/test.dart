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
    "private_key_id": "c9e25fd17358fa3252a1dd27483df29d60634f81",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDo6TLV5kDeNdcr\naRjh0KyXGVhMvWQNGmzYCgD0VBOB5DFPu5WKJBA0p45y1V8B5wiNhlIxVOQvfEYh\nkqcqR8T5IOCd0F1DRoj/s2WFylAHe8rIqfT4G7j/q8v9rLYWc5dnR4FBXbvKlx4/\n9jUO/QZ/lLBR13z7aDUqrYtd8hmGhxZRSni6WNS7mGXkS7xZ/X8tNoL70nMNS9ok\nGdx/lHxzQwu39iI4mhpULG3az+DblZ//phC1ZszArs9mDdXg3m3O/mCcYm19FK8C\nPn06BOHaLKoZF2BCw+1/jOFB5lsEtYaww1Lar8zXCmk5vAZTfy6tyU348IeJeV8r\nalIiB30PAgMBAAECggEABaWp0t/bUMfzaJ0Kumbp2FwH9QxegabTXsWXUlU7h9m1\njF5a+Nd5AR3S6VvdCtnELlJEaefKBJC5zpSUswS8dOHkME9eA4SRS8nYu061dAj/\nWLAuPVnGuYQ71PG8FH1G/X0RWDlilT3mwNxCWxOtdahwQfu8jwfuyhMdHvEAx28x\nNwSid+SFk56W0hwkfCme5s7BVCRUnf+7Mm8r2YjByWn8ZvMDnirljoAFycRGyWft\n2LWwvBgL0YfoPRJ+hld5LZNSEPuD6/BLGHzL+dsKv6LLu3tCKIHQgzlCzj0I2GqW\nl+EtFuk2Gs7k7//ObSOQqh0y2gvVuXZmKdQnM1hwiQKBgQD0+TNOPJD5s+d673w6\nqMDhSH6SRKRTh/tGM20NG82nVaeQMletkNPDToANiYdup9T38AddplCc0kkI7y1X\nJJ53KL3g+TKpwzBy6Ea61+pGlpPErcNStPPRr5ZnJ64GtY4dIvayGqQoHU3gyz/N\nC76ev0zIMpJQk4fVTvYpbB6FkwKBgQDzZQDa0bgnDNHfuixers2acO/72TqRNavk\n81rCta7GlqLDEG05+6EB5LbNQpydwJs9JMy0Ye5oYxVrcR6/Xa4TzVId9Ri92maQ\nt97fwsP+juhsizqn7s3Zl0oWS93vONnrAlE5d1ZlFbqj/4X7lbrLRVhwoV0ftpu6\nepxFJXRYFQKBgFuPlNSGIK2jxz4UqrsF/el1/hDPZRfveERZzkWbAbesdQ+ZMVon\nCm8yNPxaTetXAWuWJDqlgfXLRw72zlyGzE+/Q5EFsyDuWnpoRJ9rOh4eA6b8R0fv\naD4UQcPWed36F97eBZS2DmsL4OLHNNZ/sESHPbyJ4lQJgDiC5dC/n3zPAoGAQYBM\nE5de7Ltpe8EZkb2PPWHpY6iZN1zvTqUjJsVILM97K+2ux2ztbpoDjAfCKD4eSP0v\nTdgRFeycZhbCRJPMdi3KTJ+aMfWlpoqlIyjCIC6LZDKv7WO56DXrzUZLisaM9s7f\n1wxDpt6LJPluMD+iTnPyEhWK/y7gh/XZOk6TGeUCgYBGX/fCJTtEEpnpNRXNZ7yA\ni0g0enWwYwl9zwp/kSyTkE7nAklvt+PD/bszRb7tT4mjoquhxvLQFlODPRKh8Z91\nqBYcOF+YOqsM0jlXCAcc2xZ5NcZif72s9WIAfHZlk5/qE7jJS14LMH7juqfbJlNa\nZE8UP/kBJ39XA/sZmBEN0A==\n-----END PRIVATE KEY-----\n",
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