import 'package:dio/dio.dart';
import 'package:owner_app/app/data/models/transaction/balance_response.dart';

import '../api/transaction/transaction_api.dart';
import '../models/transaction/transaction_list.dart';

class TransactionRepository {
  final Dio _dio;

  TransactionRepository(this._dio);

  Future<List<Transaction>> getTransactions() async {
    return (await TransactionApi(_dio).getTransactions()).transaction;
  }

  Future<BalanceResponse> getBalance() async {
    return (await TransactionApi(_dio).getBalance());
  }

  Future<void> withdraw() async {
    return (await TransactionApi(_dio).withdraw());
  }
}
