import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../core/constant/constant.dart';
import '../constant/constant.dart';
import '../enum/enum_env.dart';

class Header {
  Future<Map<String, String>> getHeader() async {
    String token = await IStorage.getString(IConstant.token) ?? '';
    String appVersion = dotenv.env[EnumEnv.appVersion.value] ?? '';
    return {
      'Content-Type': 'application/json',
      'accept': 'application/json',
      'token': token,
      'app_version': appVersion,
    };
  }
}
