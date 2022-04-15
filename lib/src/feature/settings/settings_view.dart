import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/setting/theme/theme_cubit.dart';
import '../auth/presentation/bloc/auth/auth_bloc.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(4),
        children: [
          ListTile(
            title: const Text('Theme'),
            trailing: BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, themeMode) {
                return DropdownButton<ThemeMode>(
                  // Read the selected themeMode from the controller
                  value: themeMode,
                  // Call the updateThemeMode method any time the user selects a theme.
                  onChanged: (themeMode) {
                    context.read<ThemeCubit>().changeThemeMode(themeMode!);
                  },
                  items: const [
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text('System Theme'),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text('Light Theme'),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text('Dark Theme'),
                    )
                  ],
                );
              },
            ),
          ),
          ListTile(
            title: const Text('Logout'),
            trailing: IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                context.read<AuthBloc>().add(const SignOutEvent());
              },
            ),
          ),
        ],
      ),
    );
  }
}
