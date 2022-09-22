import 'package:dio/dio.dart';
import 'package:owner_app/app/data/models/ocr/scan_batti_response.dart';
import 'package:owner_app/app/data/models/ocr/set_reading_request.dart';
import 'package:retrofit/retrofit.dart';

part 'ocr_api.g.dart';

@RestApi()
abstract class OcrApi {
  factory OcrApi(Dio dio) = _OcrApi;

  @POST("/api/ocr/config-meter")
  Future<void> configMeter(@Body() SetElectricityRequest request);

  @POST("/api/ocr/caclculate-batti")
  Future<ScanBattiResponse> calculateBatti(
      @Body() SetElectricityRequest request);
}
