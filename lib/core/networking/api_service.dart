import 'package:dio/dio.dart';
import 'package:flutter_complete_proj/core/networking/api_constants.dart';
import 'package:flutter_complete_proj/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_proj/features/login/data/models/login_response.dart';
import 'package:flutter_complete_proj/features/signup/data/models/sign_up_request_body.dart';
import 'package:flutter_complete_proj/features/signup/data/models/sign_up_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
  @POST(ApiConstants.signUp)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );
  
}
