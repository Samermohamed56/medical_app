// vending_machine_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/data/repo/map/map_repository.dart';
import 'vending_machine_state.dart';

class VendingMachineCubit extends Cubit<VendingMachineState> {
  final VendingMachineRepository repository;

  VendingMachineCubit(this.repository) : super(VendingMachineInitial());

  // دالة لتحميل الآلات
  Future<void> fetchVendingMachines() async {
    try {
      emit(VendingMachineLoading()); // عندما نبدأ في تحميل البيانات
      final machines = await repository.getVendingMachines(); // جلب الآلات
      emit(VendingMachineLoaded(machines: machines)); // عند النجاح في التحميل
    } catch (e) {
      emit(VendingMachineError(message: e.toString())); // في حال حدوث خطأ
    }
  }
}
