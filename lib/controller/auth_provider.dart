import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/api_service.dart';
import 'package:cpims_dcs_mobile/core/network/preferences.dart';
import 'package:cpims_dcs_mobile/models/user_model.dart';
import 'package:cpims_dcs_mobile/views/screens/auth/login_screen.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

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
    final AuthProvider authProvider = AuthProvider();

    final response = await apiService.login(username, password);

    if (context.mounted) {
      await preferences.setString('access', response['access']);
      await preferences.setString('refresh', response['refresh']);
      // await prefs.setBool("hasUserSetup", true);

      await preferences.setInt(
        'authTokenTimestamp',
        DateTime.now().millisecondsSinceEpoch,
      );

      authProvider.setAccessToken(response['access']);

      UserModel userModel = UserModel(
        username: username,
        accessToken: response['access'],
        refreshToken: response['refresh'],
      );
      if (context.mounted) {
        setUser(userModel);
      }

      preferences.setString('username', username);
      preferences.setString('password', password);

      Get.off(() => const Homepage(),
          transition: Transition.fadeIn,
          duration: const Duration(microseconds: 300));
    }
  }

  // logout
  Future<void> logOut(BuildContext context) async {
    try {
      await preferences.clear();
      Get.off(
        () => const LoginScreen(),
        transition: Transition.fadeIn,
        duration: const Duration(microseconds: 300),
      );
      clearUser();
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
      String? refreshToken = preferences.getString('refresh');
      int? authTokenTimestamp = preferences.getInt('authTokenTimestamp');

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
