import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

Future<String?> getAccessToken() async {
  final serviceAccountJson = {
    "type": "service_account",
    "project_id": "ecommerce-d0db2",
    "private_key_id": "38bf294a5c509e4b5e53cc50beaff369759ad45b",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCoT78DyE+b5qpF\n029GFj4ZGVMm/hM1gpLRJuppB56PwXOX3qOJxyTVfvPxw5tFv4sDstI+6Nha/rQr\n42slG4LOq6b8JILDeGpgawpbcpOrYfLP/B3uFyyMf8Myl5iEmPi7m1tb6Z4CeJzi\n0mR0j5fG587kW5+R88cElAH9qJtdSJi5TJtsC9eEbjFz3BRomjxY5R4CFMZUrrGH\nyuopsNWtq+NdlmtG5IJgMS/5mCCn1MmQHLBsip4p9JwQlOb/dZgVirTzFzMLwmfq\nnPKJV+9phEAQs+Fj1sPBiapm8aG13AnzCvF1vAC2CCNW2xzrg01bhxpexZk7etIM\nT2ecWYPrAgMBAAECggEASh03jRhXKdzULMQycwfXV2EF8x0dY0o4kT3UKeSvhzjV\nyFHC7KgTCaoKDHMoe/mg4sOK/iW1I7iVqN/PLftjydLfSJdhN2beXM+1s1gMO4L5\nk2k+2rk8pi+aSjxj7juYB7Cc9ae1KvxmhSDFGGikmnM38OmBphjVEaiFCegFZfka\nBPmodO/rKa8/bDqR6aV5xVWtJK6svqY5CNMLhr0HpAGV4XLlYiZjwCILhBXueUYe\nG2qteJ6v9eImb/ezmIxSslm3t3yl/m18JWw8ZhIP0v8ZNx6DjYV/jCU8xG68MBHr\nEfhDdUpUL+gZYa5tuqJcNHsbrLZrxQ6KyxZaWQ3m3QKBgQDq67sbtDogyLdNgT1R\nSGHYQAB42YGx0DKZOoQR73zL1NKYrB9o+NASNqJce6aL4fgh6a+eaqrILwxOOl99\nfWE3s20BfiHWyRY+dgcnKRQyWFK1h0RAqeXs5HN7GOLC5WOPr6Qc9E4R4oBuEUP5\nBMKZBKekb/9RjUGO7+ZY/VSv/wKBgQC3afXQ0/eyrst3J9UHS+xxm/g26HvuqIAy\nMg0kFYayxA7S9DPRbjdxhztPXRdDmkUI97mdF081e7dGvlKVW+r3ERca27zPC1zh\n32wpHJ7BLaShRDt7vAeHx05fp3IE3h83uC3lwkpqBdj6/pAiD2OwvBh6EE456ugS\npfTTvdjsFQKBgA7XDV7Wp8ViaJHw1BrKY8PxZxY7R0IgUNH1LFqlslB+BT+3v9Q1\nw48i/GazOPYlNDOQO5PaUSeMMU7PyTB4Nyf5oa0ydpjG4yzW7+S9Z5U2lyL4hItB\nMFEirVjdXZXKP9vX0JozpKrkkBBj7tNQRaq87IoquQpBzh5lcTu15R+pAoGBAK06\nFWGDIRmQvzgt1aRLj+gJIBhz4MEaQeGmpgSjlBF43GtfGyW9C/5cc6bUTCmcJYF/\nvr3giv3/d60ICiVop/VrHcBPMvb1S2dFRflaP5JCEpABSpDlmNMjaSEsm6J/S0qr\n2CV9KB0UoscD8ItKr6P3MsLubYOEGmWqeh4V2y+1AoGBAOYZ/AI1cVINH4sg2vON\nOeiJITGBtKszS3lS0g4+i6niG4NMxwfMpFYajJLcQLsEOCTMFkUS5yl5foEizIvy\nuz1H/Ys0yWMBfqRbX15s/mYjB7nkksgtxBAGxTnuZunamT1kvO32ATbrkmqGpyFn\niKiaSWhkN015LDhJKG2xTpGZ\n-----END PRIVATE KEY-----\n",
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
        scopes,
        client);

    client.close();
    print(
        "Access Token: ${credentials.accessToken.data}"); // Print Access Token
    return credentials.accessToken.data;
  } catch (e) {
    print("Error getting access token: $e");
    return null;
  }
}