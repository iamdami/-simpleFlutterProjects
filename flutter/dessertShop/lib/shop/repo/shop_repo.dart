import 'package:actual/shop/model/shop_detailed_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

part 'shop_repo.g.dart';

@ RestApi()
abstract class ShopRepo {
  factory ShopRepo(Dio dio, {String baseUrl})
  = _ShopRepo;
  
  // @GET('/')
  // paginate();
  
  @GET('/{id}')
  @Headers({
    'authorization': "Bearer"
  })
  Future<ShopDetailedModel> getShopDetail({
    @Path() required String id,
});
}
