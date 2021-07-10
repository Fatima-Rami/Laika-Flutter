import 'dart:math';

import 'package:meow_too/model/pet.model.dart';

class PetRepository {
  Map<int, Pet> pets = {
    1: Pet(id: 1, name: "Moris", birthDate: "28-06-2017"),
    2: Pet(id: 2, name: "Couscous", birthDate: "28-06-2017"),
    3: Pet(id: 3, name: "Caramel", birthDate: "01-02-2010"),
    4: Pet(id: 4, name: "Mochi", birthDate: "04-03-2015")
  };

  Future<List<Pet>> allPets() async {
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if (rnd > 3) {
      return pets.values.toList();
    } else {
      throw new Exception("error");
    }
  }
}


