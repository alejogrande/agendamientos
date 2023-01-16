import 'package:agendamientos/data/datasources/local_data_sources_implements.dart';
import 'package:agendamientos/data/models/court_model.dart';

import 'package:agendamientos/domain/repository/booking_repository.dart';
import 'package:agendamientos/features/court_selection/bloc/court_selection_bloc.dart';
import 'package:agendamientos/features/reservation/bloc/reservation_bloc.dart';
import 'package:agendamientos/resources/colors.dart';
import 'package:agendamientos/shared_library/Utils.dart';
import 'package:agendamientos/shared_library/widgets/custom_elevated_button.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/calendar.dart';
part 'widgets/header.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  late CourtSelectionBloc courtBloc;
  late ReservationBloc reservationBloc;
  late TextEditingController dateController;
  late String? idHour;

  @override
  void initState() {
    super.initState();
    reservationBloc = BlocProvider.of<ReservationBloc>(context);
    courtBloc = BlocProvider.of<CourtSelectionBloc>(context);
    dateController =
        TextEditingController(text: Utils.formatDateTime(DateTime.now()));
    idHour = "1001";

    // courtBloc.add(CourtSelectionLoadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    BookingRepository repository =
        BookingRepository(LocalDataSourceImplement());
    final _theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Crear reserva"),
        ),
        body: BlocBuilder<ReservationBloc, ReservationState>(
            bloc: reservationBloc, // provide the local bloc instance
            builder: (context, state) {
              return (state is ReservationInitialState ||
                      state is ReservationSelectedDateState)
                  ? SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomHeader(title: state.court?.name),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Ingresar fecha:  ",
                                  style: _theme.textTheme.headline3,
                                ),
                                Flexible(
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: dateController,
                                    onTap: () async {
                                      await showDialog(
                                          context: context,
                                          builder: ((context) =>
                                              DialogSelectionCompactFecha(
                                                  state.court)));

                                      setState(() {
                                        dateController.text =
                                            Utils.formatDateTime(state.date);
                                      });
                                    },
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      iconColor: AppColors.primary,
                                      suffixIcon: Icon(
                                        Icons.edit_calendar_outlined,
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                    keyboardType: null,

                                    // style: Theme.of(context).textTheme.body1,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 42,
                            ),
                            Row(children: [
                              Text("Hora de reserva: ",
                                  style: _theme.textTheme.headline3),
                              SizedBox(
                                width: 25,
                              ),
                              Flexible(
                                child: DropdownButton(
                                  // ignore: prefer_null_aware_operators
                                  items: state.listHours != null
                                      ? state.listHours
                                          .map<DropdownMenuItem<String>>(
                                            (item) => DropdownMenuItem<String>(
                                              onTap: () {
                                                setState(() {
                                                  //CREA UNA VARIABLE DE CLASE DEL ID
                                                  //  idHour = item.userId;
                                                });
                                              },
                                              value: item.id.toString(),
                                              child: Text(item.details),
                                            ),
                                          )
                                          .toList()
                                      : null,
                                  value: idHour,
                                  onChanged: (value) {
                                    idHour = value;
                                  },
                                ),
                              ),
                            ]
                                // , onChanged: ((value) {})),
                                ),
                            state is ReservationSelectedDateState?    
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Clima: ${state.grade}°C"),
                                Image.network("${state.icon}"),
                              ],
                            ):Container(),
                            const SizedBox(
                              height: 50,
                            ),
                            Text("Nombre de la reserva:",
                                style: _theme.textTheme.headline3),
                            TextFormField(),
                            const SizedBox(
                              height: 50,
                            ),
                            CustomElevatedButton(
                              onTap: (() {}),
                              label: "Guardar",
                            )
                          ],
                        ),
                      ),
                    )
                  : Container();
            }));
  }
}
