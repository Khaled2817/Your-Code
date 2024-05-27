import 'package:dio/dio.dart';

class DioHelper{


static late Dio dio;
static init(){
dio=Dio(
  BaseOptions(
  baseUrl:'http://onedigit.tech/mazij/public/api/',
  receiveDataWhenStatusError: true ));
}

static Future<Response> getData({
required String url,
Map<String ,dynamic>? query,
String? token,
String lang='en',

})async{
dio.options.headers={
'lang':lang,
'Authorization':token??'',
'Content-Type':'application/json',
};
return await dio.get(url,queryParameters: query);
}

static Future<Response> postdata({
required String url,
Map<String ,dynamic>? query,
required Map<String ,dynamic> data,
String? token,
})async{
dio.options.headers={
'lang':'ar',
'Authorization':token??'',
'Content-Type':'application/json',
};
return await
 dio.post(url,
 queryParameters:query,
 data:data );
}

static Future<Response> puttdata({
required String url,
Map<String ,dynamic>? query,
required Map<String ,dynamic> data,
String? token,
})async{
dio.options.headers={
'lang':'en',
'Authorization':token??'',
'Content-Type':'application/json',
};
return await
 dio.put(url,
 queryParameters:query,
 data:data );
}

}


