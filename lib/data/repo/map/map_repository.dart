import 'package:dio/dio.dart';
import 'package:medical/data/service/api_service.dart';
import 'package:medical/model/vending/vending.machine.dart';

class VendingMachineRepository {
  final Dio _dio = ApiService().dio;

  VendingMachineRepository(Dio dio);

  Future<List<VendingMachine>> getVendingMachines() async {
    try {
      final response = await _dio.get('/VendingMachine');
      if (response.statusCode == 200) {
        List<VendingMachine> machines = (response.data as List)
            .map((machineData) => VendingMachine.fromJson(machineData))
            .toList();
        return machines;
      } else {
        throw Exception('Failed to load vending machines');
      }
    } catch (e) {
      rethrow;
    }
  }
}
