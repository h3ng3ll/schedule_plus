import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../routes/presentation/loading_data_widget.dart';
import 'bloc/schedule_bloc/schedule_bloc.dart';

import 'widgets/schedule_tab_loaded.dart';

class ScheduleTab extends StatefulWidget {
  const ScheduleTab({super.key});

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

class _ScheduleTabState extends State<ScheduleTab> {
  final DateTime now = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleBloc(
        dayTime: DateTime.now(),
      )..add(
          ScheduleEvent.fetchCourses(
            time: DateTime.now(),
          ),
        ),
      child: BlocBuilder<ScheduleBloc, ScheduleState>(
        builder: (context, state) {
          if (state.status == ScheduleStatus.loading) {
            return LoadingDataWidget();
          }
          return ScheduleTabLoaded(
            selectedDay: state.time,
            courses: state.courses,
          );
        },
      ),
    );
  }
}
