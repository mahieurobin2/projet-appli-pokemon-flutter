import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

final Dio dio = Dio(BaseOptions(
  baseUrl: "https://pokeapi.co/api/v2/",
  connectTimeout: 1000,
  receiveTimeout: 5000,
  sendTimeout: 5000

));

final dioProvider = Provider<Dio> ((ref){ 
  return dio;
});