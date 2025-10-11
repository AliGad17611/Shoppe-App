import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi()
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  // Add home-related API endpoints here
  // Example:
  // @GET('/home/dashboard')
  // Future<DashboardResponseModel> getDashboard();

  // @GET('/home/products')
  // Future<List<ProductModel>> getProducts();
}
