import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notification = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notification = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
        ),
      ),
      body: ListView(
        children: [
          Switch.adaptive(
            value: _notification,
            onChanged: _onNotificationsChanged,
          ),
          CupertinoSwitch(
            value: _notification,
            onChanged: _onNotificationsChanged,
          ),
          Switch(
            value: _notification,
            onChanged: _onNotificationsChanged,
          ),
          SwitchListTile(
            value: _notification,
            onChanged: _onNotificationsChanged,
            title: const Text("SwitchListTile"),
          ),
          SwitchListTile.adaptive(
            value: _notification,
            onChanged: _onNotificationsChanged,
            title: const Text("SwitchListTile.adaptive"),
          ),
          Checkbox(
            value: _notification,
            onChanged: _onNotificationsChanged,
          ),
          CheckboxListTile(
            activeColor: Colors.black,
            value: _notification,
            onChanged: _onNotificationsChanged,
            title: const Text("CheckboxListTile"),
          ),
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1980),
                  lastDate: DateTime(2030));
              print(date);
              final time = await showTimePicker(
                  context: context, initialTime: TimeOfDay.now());
              print(time);
              final booking = await showDateRangePicker(
                context: context,
                firstDate: DateTime(1980),
                lastDate: DateTime(2030),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData(
                      appBarTheme: const AppBarTheme(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              print(booking);
            },
            title: const Text(
              "What is your birthday?",
            ),
          ),
          const AboutListTile(),
        ],
      ),
    );
  }
}
