part of '../history_screen.dart';

class HistoryPayments extends StatelessWidget {
  const HistoryPayments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HistoryPaymentsCubit, HistoryPaymentsState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            return SizedBox();
          },
          loading: () {
            return SizedBox();
          },
          success: (pays) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: pays.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return pays.data?[index] != null
                    ? HistoryPaymentContainer(
                        historyPaymentModel: pays,
                        currentIndex: index,
                      )
                    : SizedBox();
              },
            );
          },
          failed: (error) {
            return Text('data');
          },
        );
      },
      listener: (context, state) {},
    );
  }
}
