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
  }

  Future<Response?> get(String _path) async{
   try{
     String _url = "$_baseUrl$_path";
     Response _response =   await dio.get(_url);

     return _response;
   }catch(e){
     print("HTTPService: Failed to get the response");
     print(e);
   };
  }
}