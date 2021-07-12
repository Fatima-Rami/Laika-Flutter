import 'package:bloc/bloc.dart';
import 'package:meow_too/bloc/pets_bloc/pets_event.dart';
import 'package:meow_too/bloc/pets_bloc/pets_state.dart';
import 'package:meow_too/enums/enums.dart';
import 'package:meow_too/model/pet.model.dart';
import 'package:meow_too/repositories/pets.repository.dart';



class PetsBloc extends Bloc<PetsEvent, PetsState> {
  PetRepository petRepository;
  PetsBloc(PetsState initialState, this.petRepository) : super(initialState);

  @override
  Stream<PetsState> mapEventToState(PetsEvent event) async*{
      yield PetsState(pets: state.pets, requestState: RequestState.LOADING);
      try {
        List<Pet> data = await petRepository.allPets();
        yield PetsState(pets: state.pets, requestState: RequestState.LOADED);
      } catch (e) {
        yield PetsState(pets: state.pets, requestState: RequestState.ERROR, errorMessage: e.toString());
      }

  }



}