import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

Future<String?> getAccessToken() async {
  final serviceAccountJson = {
    "type": "service_account",
    "project_id": "ecommerce-d0db2",
    "private_key_id": "e0bfeab4a25b213c8ff9d2a5fbd7a4c545f38724",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCodMh7CuQQTYy8\nq9DsIk4Zzx3Tmg7sRrBF8gdmmEZwg1RSaLBDqBA5yGLObVKbvKcKEV47iMCU4fvL\nNKW8GDMHrIKuDp4Ki/41dKqfWpq+1QD2U+L4Bc+v3v3Q12o755seUr11lPFSAr1c\n0jZ1CYk+vB09pHGFyURmY7t0bN1QvxV2/fptJLVxQNjTn67q8XZyC4Qntnv2sT4w\nV34JWT0TUSovDijAywl2TgZlBZ9x2yYhHircnUtEBHMJBplZDmhhko07Ef7jWqHd\nYlvaMQic6U6P2o8zt4E2to4AxH2TGKvbeE2QfiMz8zCvwcIocth9CUWgsdwLkUL/\njbznXkmTAgMBAAECggEASFgG9RiDQyEazLf4/D/rTJgvFf22ZPAiqZc8aGoC7jTo\nVI/TCus1NKuDC2XVsT4+ektlLaoYEphOW0Fb38CAwc3rPTbX1m2ymWBmGhN+G3A8\nfo0eDyfnvn7EgBjS7bEUY9xiswlo7bBxhFhevLqAr2l4IU3q1urNri8shN5v2UnT\nD/uzE3iOvjyY7F2toAeSKPelXyx933h1aVZzKXRx3mkExguLFrpzc2Y2vOlQXfK0\nZXMoVs21PU6N/b3bDnBJM2ynxDqWExCwf3/ULZVmKEkzRgUw6sdJHmTWyfrZU+Ej\nzrFXGbDzrrSj4t75Y+5Y2HUancUk/GJepvzGWyE5yQKBgQDqZKgMwPe4CYoVqhxH\n9zW+AcC0wJ86vaiUdBTQ/vp3KKTQhBtBgN92MrdlLVCzv2gKJIrbtn4INtuOP6IP\ni+QJxXPyBksX3Q0ssaIvGUa8sowFy4WZTR+oTDY3u2GCaGexIO+tDF+6z1eckIUL\nNO+lCW5hfq35FvAL71585DFbjwKBgQC3/BuYx8Q5F+VEehGkQpd432O4aQeLxZ1j\nhvFBW1N0filzm7g8B1ufzKDJ2OINIXQdplVjH6CYFBC2567X5Rfj6SceP+8qpUfC\nNdET4czbHzUcwCTDQYDdAL/6c3gSRb83lK0DDNPWX3Tjk+/cvGBdxE2TmadgN64v\ncA8ck4K/vQKBgH+NZyYJnMS57Dr954YCMWzE52l1qTD+JM8knG9fUk2mAIq4WVy8\nFN7tmn+kuVYXwzZBzI7kMJGnyLMQTdDH/8CRgxch9Zt238SCpg+bYbMuNqSwrHNQ\nVPnw/1A02EtvJX5uvf8dzLqMOtEolD4VAJR/HWJQ3bu/j8Hu8SxlwbZhAoGAQOFn\nvfXcbaHOmNpPNFTDY72rRdHL9m9GtF1W4IxbHr6K0Zj9XDXgCrc3kFaqSKUedII+\npEj38glJZ6bGEp5YUWfcAp/bMHe+mW8u/srm2fLkYPIlRLHpxoXILYLgudjcuLX2\nWRgB8BwTdVmrAXVwqkBadw19Z8Ha7CGhQpuGRSUCgYBqb/IBAD9NGFr/t5+XyPvi\n3qGwRU2MTeRstgj12fpqIUvof4094mSEWs+a1JNG5LrrSfk3OCRMKJ5LKynsDSe/\nvVFstP+ZAt9/RtJrV11FkJnr8IrbEYaf/4tIBJy74MREWGOLdq0lxJrU07vySOTf\nMAjBUZiB75/hz51v5wg6vQ==\n-----END PRIVATE KEY-----\n",
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
    print(
        "Access Token: ${credentials.accessToken.data}"); // Print Access Token
    return credentials.accessToken.data;
  } catch (e) {
    print("Error getting access token: $e");
    return "";
  }

}