import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invtrack/core/routes/routes.dart';
import 'package:invtrack/core/widget/app_bar.dart';
import 'package:invtrack/core/widget/signin_button.dart';
import 'package:invtrack/features/location/widget/location_dropdown_textfiled.dart';
import 'package:invtrack/features/location/widget/step_procces.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String? selectedLocation;
  String? selectedFloor;
  String? selectedRoom;

  int get currentStep {
    if (selectedLocation == null) return 0;
    if (selectedFloor == null) return 1;
    if (selectedRoom == null) return 2;
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
              title: 'تحديد الموقع',
              subtitle: 'أختر الموقع لبدء عملية الجرد',
              icon: Icons.location_on,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  StepProcces(currentStep: currentStep),
                  SizedBox(height: 40),
                  LocationDropdownField(
                    label: 'أختر الموقع',
                    items: const ['مخزن 1', 'مخزن 2', 'مخزن 3'],
                    value: selectedLocation,
                    onChanged: (value) {
                      setState(() {
                        selectedLocation = value;
                        selectedFloor = null;
                        selectedRoom = null;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  LocationDropdownField(
                    label: 'أختر الدور',
                    items: const ['دور 1', 'دور 2', 'دور 3'],
                    value: selectedFloor,
                    onChanged: selectedLocation == null
                        ? null
                        : (value) {
                            setState(() {
                              selectedFloor = value;
                              selectedRoom = null;
                            });
                          },
                  ),
                  SizedBox(height: 20),
                  LocationDropdownField(
                    label: 'اختر الغرفة',
                    items: const ['غرفة 1', 'غرفة 2', 'غرفة 3'],
                    value: selectedRoom,
                    onChanged:
                        (selectedLocation == null || selectedFloor == null)
                        ? null
                        : (value) {
                            setState(() {
                              selectedRoom = value;
                            });
                          },
                  ),
                  SizedBox(height: 40),
                  SignInButton(
                    onPressed: () {
                      final data = <String, String>{};
                      if (selectedLocation != null) data['location'] = selectedLocation!;
                      if (selectedFloor != null) data['floor'] = selectedFloor!;
                      if (selectedRoom != null) data['room'] = selectedRoom!;
                      GoRouter.of(context).go(Routes.placescreen, extra: data);
                    },
                    text: 'بدء عملية الجرد',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
