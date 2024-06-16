import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/api_service.dart';
import 'package:cpims_dcs_mobile/core/network/http_client.dart';
import 'package:cpims_dcs_mobile/models/user_model.dart';
import 'package:cpims_dcs_mobile/views/screens/auth/login_screen.dart';
import 'package:cpims_dcs_mobile/views/widgets/initial_loader.dart';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user = UserModel(
    username: '',
    accessToken: '',
    refreshToken: '',
  );

  UserModel? get user => _user;

  setAccessToken(String accessToken) {
    if (user != null) {
      _user = _user.copyWith(accessToken: accessToken);
    }
    notifyListeners();
  }

  void setUser(UserModel userModel) {
    _user = userModel;
    notifyListeners();
  }

  void clearUser() {
    _user = UserModel(
      username: '',
      accessToken: '',
      refreshToken: '',
    );

    notifyListeners();
  }

  Future<void> login({
    required BuildContext context,
    required String password,
    required String username,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final AuthProvider authProvider = AuthProvider();

    final response = await httpClient.request(
      '${cpimsApiUrl}api/token/',
      "POST",
      {
        'username': username,
        'password': password,
      },
    );

    if (context.mounted) {
      await prefs.setString('access', response.data['access']);
      await prefs.setString('refresh', response.data['refresh']);
      // await prefs.setBool("hasUserSetup", true);

      await prefs.setInt(
        'authTokenTimestamp',
        DateTime.now().millisecondsSinceEpoch,
      );

      authProvider.setAccessToken(response.data['access']);

      UserModel userModel = UserModel(
        username: username,
        accessToken: response.data['access'],
        refreshToken: response.data['refresh'],
      );
      if (context.mounted) {
        setUser(userModel);
      }

      prefs.setString('username', username);
      prefs.setString('password', password);

      Get.off(() => const InitialLoaderScreen(),
          transition: Transition.fadeIn,
          duration: const Duration(microseconds: 300));
    }
  }

  // logout
  Future<void> logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      await sharedPreferences.remove('access');
      await sharedPreferences.remove('refresh');

      clearUser();

      Get.off(
        () => const LoginScreen(),
        transition: Transition.fadeIn,
        duration: const Duration(microseconds: 300),
      );
    } catch (e) {
      if (context.mounted) {
        errorSnackBar(context, e.toString());
      }
    }
  }

  Future<bool> verifyToken({
    required BuildContext context,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? refreshToken = prefs.getString('refresh');
      int? authTokenTimestamp = prefs.getInt('authTokenTimestamp');

      if (refreshToken != null && authTokenTimestamp != null) {
        int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
        int tokenExpiryDuration =
            1800 * 1000; // Token expires after 30 minutes (in milliseconds)

        if (currentTimestamp - authTokenTimestamp > tokenExpiryDuration) {
          // Token has expired -- refresh token
          // get new token
          final response = await apiService.refreshToken();
          if (context.mounted) {
            if (context.mounted) {
              setUser(UserModel(
                username: user!.username,
                accessToken: response['access'],
                refreshToken: refreshToken,
              ));
            }
          }
          return true;
        } else {
          setAccessToken(refreshToken);
          return true;
        }
      }
    } catch (e) {
      if (context.mounted) {
        errorSnackBar(context, e.toString());
      }

      return false;
    }
    return false;
  }
}
