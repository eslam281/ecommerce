import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

import 'core/services/services.dart';

// Cached client

Future<String?> getAccessToken()async {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("accesstoken") == null) {

  final serviceAccountJson = {
    "type": "service_account",
    "project_id": "ecommerce-d0db2",
    "private_key_id": "6848e638cba9cb3a337041e6fa1723343216b49a",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCVMHGkQGZbkAk1\nACVJZgcdjzyEdeB55g+b7RYFijI7S9ef7JVMVWmaVDZF84/L/FKB5bCoEOVuoiL4\nAPXZem7lwpqTToaTPulcweu960eDJevMSNP/6LdD56EVfgZlT5XTXUyjHSt95SnU\n6w6RHug6OoyNZ6mUo50wrWi+Yhztb6rlFJCrNIaJv53oiIuWGR4RAKkDY6b651Vn\nxOXnlI+9Kne13R6GdgNBEb0xEornbNkTcwd3QwEPEFcVPVQcsK2l6I1vwuSLGJ+J\n/CwmxHpPPDqPfMYtDFBXAFkZipvEiNymxdhtZ2cn11oPjMmcagjMUlLwtFdBwxDm\neoOu9iiXAgMBAAECggEAJyy+WowSlK6AzGsKX3isG6X2FS5C0J+Jr78UzkWYpRto\nNnVQSugOv9inG702IDFUlQl0Vt2A8Ykft5HA/Od6YVi1cELpcZbOfm3pckhq0dRO\nU6k4CfXY0brsAJHEKiw4wnS4YAiT2A4p6uACRjcgcdHYAHWdAQvphdOzMnLe97W5\nK55U2qTR3SuwFTAl0GGttJqZKz/kQjcnv7PmRvQbzRB8FMFlONMBZcSGONfbRWgB\numcJ/z+txEzA9xrKPB8+zsYsDjwx37sODPFjTZ2pFn3NwHBOHemsxkOYt0U1i/2S\nTf2LK54e6J9Q33dzZaNuuIdtUQuxLn5Jr9QIvl9RqQKBgQDLCaaDbgC4Y9VG/6H5\nT0KJJw6xWlD+6yzJyg87k3sulUStHyOkNnvOMPx46XG/LgYNYoLtNO26QQ9YcDRa\nORYjePP8ujLwLaljVU2O+m3dYkyCOC+Ar+bpvevYy8iZPRRxjgiHu3rvUKoe26iH\nSTRAt3ITGeR3rm02gS3Gi5loSwKBgQC8Gu2EPzco4GgkOrM0aqMjsFsdKjmQe0K8\nMCdRW5N0gcJHxCYHH/CI3MMjBs/+1YNPkzvvJPU8v7caG5XFlirSj8bHmGqosTO0\ndoBn18i3QPFDeNiixcnUQ6gsxv9zQYk9gicUqw/CyhFRDwY1P214w3zOV/Mrqcaz\nBHJZ/7QpZQKBgFWMxWqPiSIofo8h2z/PE7vyhxBXe9VNhluoFe8GX1rrbjp76mqg\nwl3I6jiQNGtXmxk8run/6UMXcr3S2VxCvX9I0ZVlZ10oAD1ojft2raAgcRhVUD6q\n32MRsTRx+R4ITHrkW9fFOTFpDaVe7I3EXI4APcKqoEeFaWMT3xPPcl4tAoGAUFTf\nol6s29QaJX68EWKJETC7eJUTyFQbh+q4n9IQAu13XtaxttE5E/nTjB3YrefZEB68\ntcB+ytbFB21IZP1ghFPKfGrnAevLPQJui+pnWXtujXYKblkxfGj4ZUcGyN3wEkiH\nEBiNvo41HvzfldXklnJF1olQ3BDBPqpje3PsKNECgYBaQZWSThLLehoCoM77j6aB\nLaKQbbMRyOyyHXh4CW5ZcZNMfP/7oULvV1vp1Lm4aoWj1oYAfEwJ5fS1sE28X/O2\npxSK60yGFDXWJvSXeFRaUg8QhdP3ovOJO93vEavGsHGjpEDSN1aOSifDcntPfqJf\nK2qsxldAgNvXGjNCkFXjIA==\n-----END PRIVATE KEY-----\n",
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