import 'package:dio/dio.dart';
import 'package:owner_app/app/data/models/transaction/balance_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/transaction/transaction_list.dart';

part 'transaction_api.g.dart';

@RestApi()
abstract class TransactionApi {
  factory TransactionApi(Dio dio) = _TransactionApi;

  @GET("/api/payment/my-transactions")
  Future<TransactionList> getTransactions();

  @GET("/api/payment/withdraw")
  Future<BalanceResponse> getBalance();

  @POST("/api/payment/withdraw")
  Future<void> withdraw();
}
