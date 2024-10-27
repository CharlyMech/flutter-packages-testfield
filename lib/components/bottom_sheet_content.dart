import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kitchen/constants/themes.dart';
import 'package:flutter_kitchen/cubits/theme/theme_cubit.dart';
import 'package:flutter_kitchen/cubits/theme/theme_state.dart';
import 'package:flutter_switch/flutter_switch.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        bool isSystemDefault = themeState is SystemThemeState;
        return Wrap(
          children: [
            Container(
              color: Theme.of(context).colorScheme.surface,
              padding: const EdgeInsetsDirectional.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          //? Maybe better approach the IconButton
                          iconSize: 30,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                          alignment: Alignment.center,
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close_rounded))
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 15.0, left: 15.0, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Theme selector:',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Opacity(
                              opacity: isSystemDefault ? 0.7 : 1,
                              child: FlutterSwitch(
                                value: themeState is DarkThemeState,
                                width: 75,
                                height: 40,
                                borderRadius: 24,
                                toggleSize: 32,
                                activeIcon: Icon(
                                  Icons.dark_mode_rounded,
                                  color: Theme.of(context).primaryColor,
                                ),
                                inactiveIcon: Icon(Icons.light_mode_rounded,
                                    color: Theme.of(context).primaryColor),
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                onToggle: (_) => isSystemDefault
                                    ? null
                                    : context.read<ThemeCubit>().toggleTheme(),
                              ),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: isSystemDefault,
                                  onChanged: (_) {
                                    if (isSystemDefault) {
                                      context
                                          .read<ThemeCubit>()
                                          .setTheme(ThemeType.light);
                                    } else {
                                      context
                                          .read<ThemeCubit>()
                                          .setTheme(ThemeType.system);
                                    }
                                  },
                                ),
                                const Text(
                                  'System default',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    // TODO -> CustomDivider component, make it all agnostic
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5),
                    child: Opacity(
                        opacity: 0.15,
                        child: Divider(
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        )),
                  ),
                  // TODO -> This widget is repeated through all my apps -> create importable component
                  // About me and this app section component
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
