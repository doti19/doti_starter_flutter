import 'package:doti_starter/index.dart';
import 'package:doti_starter/src/core/di/di_container.dart';
import 'package:doti_starter/src/core/generated/l10n.dart';
import 'package:doti_starter/src/features/auth/application/register_form/register_form_bloc.dart';
import 'package:doti_starter/src/features/auth/application/sign_in_form/sign_in_form_bloc.dart';
import 'package:doti_starter/src/features/auth/presentation/auth_page.dart';
import 'package:doti_starter/src/features/core/presentation/widgets/alert_helper.dart';
import 'package:flutter/material.dart';
import 'package:doti_starter/src/core//routes/index.dart' as router;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/presentation/widgets/loading_overlay.dart' as Loading;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = 'home';
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    void onSelected(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    final destinations = router.destinations
        .map((e) => NavigationDestination(
              icon: e.icon,
              selectedIcon: e.selectedIcon,
              label: e.label,
            ))
        .toList();

    return LayoutBuilder(
      builder: (context, dimens) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => diContainer<SignInFormBloc>(),
            ),
            BlocProvider(
              create: (context) => diContainer<RegisterFormBloc>(),
            )
          ],
          child: BlocConsumer<SignInFormBloc, SignInFormState>(
            listenWhen: (p, c) =>
                p.authFailureOrSuccessOption != c.authFailureOrSuccessOption,
            listener: (context, state) {
              state.authFailureOrSuccessOption.fold(
                () {},
                (either) => either.fold(
                  (failure) => AlertHelper.showSnackBar(
                    context,
                    message: failure.map(
                      userError: (_) => S.of(context).userError,
                      storage: (_) => S.of(context).storageError,
                      server: (value) =>
                          value.message ?? S.of(context).serverError,
                      noConnection: (_) => S.of(context).noConnectionError,
                    ),
                  ),
                  (_) {},
                ),
              );
            },
            buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
            builder: (context, state) {
              return BlocConsumer<RegisterFormBloc, RegisterFormState>(
                listenWhen: (p, c) =>
                    p.authFailureOrSuccessOption !=
                    c.authFailureOrSuccessOption,
                listener: (context, state) {
                  state.authFailureOrSuccessOption.fold(
                    () {},
                    (either) => either.fold(
                      (failure) => AlertHelper.showSnackBar(
                        context,
                        message: failure.map(
                          userError: (_) => S.of(context).userError,
                          storage: (_) => S.of(context).storageError,
                          server: (value) =>
                              value.message ?? S.of(context).serverError,
                          noConnection: (_) => S.of(context).noConnectionError,
                        ),
                      ),
                      (_) {},
                    ),
                  );
                },
                buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
                builder: (context, state) {
                  return Stack(children: [
                    const AuthPage(),
                    Loading.LoadingOverlay(isLoading: state.isSubmitting)
                  ]);
                },
              );
            },
          ),
        );
        // body: Stack(
        //   children: [
        //     router.destinations[currentIndex].screen,
        //   ],
        // ),
        // bottomNavigationBar: NavigationBar(
        //   destinations: destinations,
        //   selectedIndex: currentIndex,
        //   onDestinationSelected: onSelected,
        // ),
      },
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:scalable_flutter_app_starter/core/extension/context.dart';
// import 'package:scalable_flutter_app_starter/feature/user/ui/widget/profile_tab.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;

//   final _tabs = <_HomeTab>[
//     _HomeTab(
//       label: 'Home',
//       icon: Icons.home,
//       builder: (context) => const Center(child: Text('Home')),
//     ),
//     _HomeTab(
//       label: 'Explore',
//       icon: Icons.explore,
//       builder: (context) => const Center(child: Text('Explore')),
//     ),
//     _HomeTab(
//       label: 'Profile',
//       icon: Icons.person,
//       builder: (context) => const ProfileTab(),
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final Widget body;
//     final Widget? bottomNavigationBar;
//     final content = _tabs[_selectedIndex].builder(context);

//     if (context.isWide) {
//       body = Row(
//         children: [
//           NavigationRail(
//             selectedIndex: _selectedIndex,
//             onDestinationSelected: (index) {
//               setState(() => _selectedIndex = index);
//             },
//             destinations: [
//               for (final tab in _tabs)
//                 NavigationRailDestination(
//                   label: Text(tab.label),
//                   icon: Icon(tab.icon),
//                 ),
//             ],
//           ),
//           Expanded(child: content),
//         ],
//       );
//       bottomNavigationBar = null;
//     } else {
//       body = SafeArea(child: content);
//       bottomNavigationBar = BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: (index) => setState(() => _selectedIndex = index),
//         items: [
//           for (final tab in _tabs)
//             BottomNavigationBarItem(
//               label: tab.label,
//               icon: Icon(tab.icon),
//             ),
//         ],
//       );
//     }

//     return Scaffold(
//       body: body,
//       bottomNavigationBar: bottomNavigationBar,
//     );
//   }
// }

// class _HomeTab {
//   const _HomeTab({
//     required this.label,
//     required this.icon,
//     required this.builder,
//   });

//   final String label;
//   final IconData icon;
//   final WidgetBuilder builder;
// }
