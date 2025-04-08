
import 'package:medical/model/vending/vending.machine.dart';

abstract class VendingMachineState {}

class VendingMachineInitial extends VendingMachineState {}

class VendingMachineLoading extends VendingMachineState {}

class VendingMachineLoaded extends VendingMachineState {
  final List<VendingMachine> machines;
  VendingMachineLoaded({required this.machines});
}

class VendingMachineError extends VendingMachineState {
  final String message;
  VendingMachineError({required this.message});
}
