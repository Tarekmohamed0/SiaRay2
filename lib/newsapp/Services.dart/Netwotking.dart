import 'package:dio/dio.dart';

void main() {
  GetNews();
}

final dio = Dio();
void GetNews() async {
  final response = await dio.get(
      'https://newsapi.org/v2/everything?q=bitcoin&apiKey=3f20c98f95c848adb3db53d8529d8214');
  Map<String, dynamic> jsondata = response.data['articles'];
  for (int i = 0; i < jsondata.length; i++) {
    final count = i;
    print(jsondata[i]['title']);
    print(jsondata[i]['author']);
    print(i);
  }
}
