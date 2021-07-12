import 'package:meow_too/enums/enums.dart';
import 'package:meow_too/model/pet.model.dart';

class PetsState{
  List<Pet> pets;
  RequestState requestState;
  String errorMessage;

  PetsState({required this.pets, required this.requestState, this.errorMessage=""});
}