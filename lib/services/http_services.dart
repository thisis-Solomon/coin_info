import 'package:coin_info/models/app_config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class HTTPServices{
  final Dio dio = Dio();
  AppConfig? _appConfig;
  String? _baseUrl;

  HTTPServices(){
    _appConfig = GetIt.instance.get<AppConfig>();
    _baseUrl = _appConfig!.COIN_API_BASE_URL;
    print(_baseUrl);
  }
}