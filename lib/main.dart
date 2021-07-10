import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meow_too/repositories/pets.repository.dart';
import 'package:meow_too/ui/pages/pets/pets.page.dart';

import 'bloc/pets_bloc/pets.bloc.dart';
import 'bloc/pets_bloc/pets.state.dart';
import 'enums/enums.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PetsBloc(PetsState(pets: [],requestState: RequestState.NONE, errorMessage: ""), new PetRepository()),)
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.purple[100],
          textTheme: TextTheme(
            bodyText2: TextStyle(fontSize: 22, color: Colors.purple),
          ),
        ),
        routes: {
          "/pets":(context)=>PetsPage(),
        },
      ),
    );
  }
}

