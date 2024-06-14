import 'package:flutter/material.dart';
import 'package:movil/application/appointment_function/bloc/pets_bloc.dart';
import 'package:movil/application/appointment_function/bloc/pets_event.dart';
import 'package:movil/application/appointment_function/bloc/pets_state.dart';
import 'package:movil/application/appointment_function/ui/create_appontment.dart';
import 'package:movil/application/appointment_function/ui/horizontal_list_petcards.dart';
import 'package:movil/application/appointment_function/ui/vertical_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final PetsBloc petsBloc = PetsBloc();

  @override
  void initState() {
    petsBloc.add(PetsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color(0xFF2BBCC5),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Schedule appointments",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                BlocConsumer<PetsBloc, PetsState>(
                  bloc: petsBloc,
                  listenWhen: (previous, current) => current is PetsActionState,
                  buildWhen: (previous, current) => current is! PetsActionState,
                  listener: (context, state) {},
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case PetsFetchingSuccesfulState:
                        final successState =
                            state as PetsFetchingSuccesfulState;
                        return HorizontalListPetCards(pets: successState.pets); //Lista de mascotas horizontal mascota de la que pertenecen los datos - cambiar por overlay

                      default:
                      return CircularProgressIndicator();
                    }
                  },
                )
              ],
            ),
          ),
          Expanded(
              child: //VerticalList()
                  CreateAppointmentData())
        ],
      ),
    );
  }
}
