import 'package:flutter/material.dart';
import 'package:movil/application/appointment_function/bloc/clinics_bloc.dart';
import 'package:movil/application/appointment_function/bloc/clinics_event.dart';
import 'package:movil/application/appointment_function/bloc/clinics_state.dart';
import 'package:movil/application/appointment_function/bloc/pets_bloc.dart';
import 'package:movil/application/appointment_function/bloc/pets_event.dart';
import 'package:movil/application/appointment_function/bloc/pets_state.dart';
import 'package:movil/application/appointment_function/bloc/vets_bloc.dart';
import 'package:movil/application/appointment_function/bloc/vets_event.dart';
import 'package:movil/application/appointment_function/bloc/vets_state.dart';
import 'package:movil/application/appointment_function/ui/create_appontment.dart';
import 'package:movil/application/appointment_function/ui/horizontal_list_petcards.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movil/application/appointment_function/ui/vertical_list_clinics.dart';
import 'package:movil/application/appointment_function/ui/vertical_list_vets.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  int currentStep = 0;
  bool get isFirstStep => currentStep == 0;
  bool get isLastStep => currentStep == stepsToCreateAppointment().length - 1;
  final PetsBloc petsBloc = PetsBloc();
  final ClinicsBloc clinicsBloc = ClinicsBloc();
  final VetsBloc vetsBloc = VetsBloc();

  @override
  void initState() {
    petsBloc.add(PetsInitialFetchEvent());
    clinicsBloc.add(ClinicsInitialFetchEvent()); //inicia siempre
    vetsBloc.add(VetsInitialFetchEvent()); //agrega el id de la clinica, mover init al stepper
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
                      case PetsFetchingLoadingState:
                        return const CircularProgressIndicator();
                      case PetsFetchingSuccesfulState: //no tocar
                        final successState =
                            state as PetsFetchingSuccesfulState;
                        return HorizontalListPetCards(
                            pets: successState
                                .pets); //Lista de mascotas horizontal mascota de la que pertenecen los datos - cambiar por overlay
                      default:
                        return const CircularProgressIndicator();
                    }
                  },
                )
              ],
            ),
          ),
          Expanded(
              child: Stepper(
            steps: stepsToCreateAppointment(),
            currentStep: currentStep,
            onStepContinue: () {
              if (isLastStep) {
              } else {
                setState(() {
                  currentStep += 1;
                });
              }
            },
            onStepCancel: isFirstStep
                ? null
                : () => setState(() {
                      currentStep -= 1;
                    }),
            onStepTapped: (step) => setState(() {
              currentStep = step;
            }),
          ))
        ],
      ),
    );
  }

  List<Step> stepsToCreateAppointment() => [
        Step(
            isActive: currentStep >= 0,
            title: const Text('Select a Clinic'),
            content: BlocConsumer<ClinicsBloc, ClinicsState>(
              bloc: clinicsBloc,
              listenWhen: (previous, current) => current is ClinicsActionState,
              buildWhen: (previous, current) => current is! ClinicsActionState,
              listener: (context, state) {},
              builder: (context, state) {
                switch (state.runtimeType) {
                  case ClinicsFetchingLoadingState:
                    return const CircularProgressIndicator();
                  case ClinicsFetchingSuccesfulState:
                    final successState = state as ClinicsFetchingSuccesfulState;
                    return VerticalListClinics(clinics: successState.clinics);
                  default:
                    return const CircularProgressIndicator();
                }
              },
            )),
        Step(
            isActive: currentStep >= 1,
            title: const Text('Select a Veterinarian'),
            content: BlocConsumer<VetsBloc, VetsState>(
              bloc: vetsBloc,
              listenWhen: (previous, current) => current is VetsActionState,
              buildWhen: (previous, current) => current is! VetsActionState,
              listener: (context, state) {},
              builder: (context, state) {
                switch (state.runtimeType) {
                  case VetsFetchingLoadingState:
                    return const CircularProgressIndicator();
                  case VetsFetchingSuccessfulState:
                    final successState = state as VetsFetchingSuccessfulState;
                    return VerticalListVets(vets: successState.vets);
                  default:
                    return const CircularProgressIndicator();
                }
              },
            )
            ),
        Step(
            isActive: currentStep >= 2,
            title: const Text('Add a description'),
            content:
                //Text('')
                CreateAppointmentData())
      ];
}
