import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static Future<void> storeAllIdentity(
      {required String accesstoken, required String refreshToken}) async {
    await storeAccessToken(accesstoken);
    await storeRefreshToken(refreshToken);
  }

  static Future<String?> getAccessToken() async {
    return await storage.read(key: "accessToken");
  }

  static Future<void> storeAccessToken(String token) async {
    return await storage.write(key: "accessToken", value: token);
  }

  static Future<String?> getRefreshToken() async {
    return await storage.read(key: "refreshToken");
  }

  static Future<void> storeRefreshToken(String token) async {
    await storage.write(key: "refreshToken", value: token);
  }

  static Future<void> storeIdentity(String id) async {
    await storage.write(key: "idToken", value: id);
  }

  static Future<String?> getIdToken() async {
    return await storage.read(key: "idToken") ?? dotenv.env['OPEN_API_KEY'];
  }

  static Future<void> deleteIdToken() async {
    return await storage.delete(key: "idToken");
  }

  static Future<void> deleteToken() async {
    await storage.deleteAll();
  }
}
