part of '../main_screen.dart';

class Balance extends StatelessWidget {
  const Balance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return state.when(
          initial: () => Countup(
            begin: 0,
            end: 0,
            duration: Duration(seconds: 1),
            precision: 2,
            style: TextStyle(
              fontSize: 36,
            ),
          ),
          loading: () => Countup(
            begin: 0,
            end: 0,
            duration: Duration(seconds: 1),
            precision: 2,
            style: TextStyle(
              fontSize: 36,
            ),
          ),
          loaded: (user) => Countup(
            begin: 0,
            end: 0,
            duration: Duration(seconds: 1),
            precision: 2,
            style: TextStyle(
              fontSize: 36,
            ),
          ),
          failed: (e) => Text(
            e,
            style: Styles.ts16(Styles.white),
          ),
        );
      },
    );
  }
}
