import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

Future<String?> getAccessToken() async {
  final serviceAccountJson = {
    "type": "service_account",
    "project_id": "ecommerce-d0db2",
    "private_key_id": "b723b17c06284afc1504987eb825a8288b4423a8",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCH5aO6x9grrypP\nCHrsStyAwkF0eEGzO4jLQgdOt/BOPsEZ8Czm2S+WHXkNq0vpZbLLmVyXOIokJrNq\nKk1p5upuJpHnZq/E4qCFSm9PFNw1gSdoWh8mLBa9RlOLOXKQjU3YyJic72jkiite\nAe+nqTGdjm/brzo0LC/p38IWA/y6y3Hge88ZlwpHO7tOYJsv8PQyo2c5zf9KImeh\nN61N+BhKDKOiFAXfERHJiFiy1xYvEQSccIzQ9/164S5c/a4Mqnltlu0Oe27E1GRu\nF3Q1o3CdWO25Yp62WtrIO+0xwPK8tyD0TFwzrALPa3ifpflwDKXIOgd1JYYEMCY9\n4hPkguJlAgMBAAECggEACS5K6uXwZTcewRseDtOZ5Pr6qA8txRmLCsxJqRhFHEwi\nCIoQxoG6tMYF9RXy+XAc7aNNPYwczQduTIhSFYr7oHhrl/n4evEijg6yyWFr5RN2\nIZchDpeg66WSJFA7vKdHMJOQt912tSXeeynfUnDcQLwsM2e5o2euzvqGZq1bSBU4\nRxJ5FmVfPV0oKbFfu1/3duUIsjgsG+lSoqhGYGnkwydA8G3rSuJFSfz3kYLLYKrv\nn/Ps45/RkSxYrQ+ysb8Lfd6VmSZE3ifaJbucdGC5wEUinwEhdJbSDUTym+O9iQLk\nqouhBDbB5qlrg7luSB+nNfdWIOZ3sqUihRSjNA46WwKBgQC61BW1VpgbjNoHnGw1\nO2Xkr2BruwSXkSfHGZOU7KpZP/VSXMAYLwkDfT4NapHPnfY7xkToaRFRxhMxy4hc\n5pbaqMdFUrAgiIZzOK3t49pSscVuSRc9gAApkP06WJ4vaxu9xexcmcaeRDZ9DZOj\nF42M1rRlll8wayJOwHW7GfMPFwKBgQC6NjBCtMY7U5U36QbKHWHB1siK2K0cqrOI\nvOYYZenoual0CgqKn6olPN3DB5s7cEX9BqZnddLilA3qcmMWuXJ1+z6ktqB9ExDW\nYALLu8n6CvqvRujMV0Rdi1+pzwajPieQFQ+9drJNPy71jIYmujd/E4vt4/Gxq5/F\nYTKgKNAn4wKBgQCgfB5JryDqSYvgjdXFxEg6sQu6fuPq7p2kwauseb+6+t3Y6iN4\noq6zeJodHDY0ihRCNIZsvhRKkkNauuNgKhPbsK+8NNNmnuAficieWOPptRtLKS31\nfkalbg6YWBdJ1E/4LFRlFxMuUJodwdPYfRryqFw+B3WtOdo2m8yF9Dx98QKBgEIq\ndRWO1I1KEtCODaqNrCnLXvDvMvvnr+mbbYsn02itaAfidYJyX2vh586gCkmhiEzz\nKvfCRw/ZmeQ/hvQRKxm/D7BJcFdhCe+SqAuqi4c8lXzojlnlfFZc6r4U4P/qWvZ4\ndWJWJd8K323C4/wo2QVfda4u+7etCxWAhxOfzO8PAoGAA+cQs1z72atLPtyt5dKe\nIHlHJeFmDL1iiiEzbwvO6qozdkhzdnb9e/PU0g1oE+IcS70XMCR9JL9XH0eHjE54\nMIA4ZqUsRz254b72WSsXy9OV3gmEsE0eZ8eJJmKI77o90j6UqsBZowdeo7PfODCl\nt9WlSZDT3uSSO0kd4qbs9V4=\n-----END PRIVATE KEY-----\n",
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