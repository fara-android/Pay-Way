import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/data/models/history/history_payment_model.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_button.dart';

class HistoryPaymentContainer extends StatelessWidget {
  final HistoryPaymentModel historyPaymentModel;
  final int currentIndex;
  const HistoryPaymentContainer({
    Key? key,
    required this.historyPaymentModel,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        backgroundColor: Styles.backgroundColor,
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                color: Styles.backgroundColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        CupertinoIcons.share_up,
                        color: Styles.backgroundColor2,
                      ),
                      SizedBox(width: 12),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Icon(
                            CupertinoIcons.clear,
                            color: Styles.backgroundColor2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    historyPaymentModel.data?[currentIndex].details ?? '',
                    style: Styles.ts24(
                      Styles.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 36),
                  Text(
                    'Номер кошелька',
                    style: Styles.ts16(Styles.grey4),
                  ),
                  SizedBox(height: 16),
                  Text(
                    historyPaymentModel.data?[currentIndex].user?.phone ?? "",
                    style: Styles.ts18(Styles.grey4),
                  ),
                  SizedBox(height: 12),
                  Divider(color: Styles.backgroundColor2),
                  Text(
                    'Сумма',
                    style: Styles.ts16(Styles.grey4),
                  ),
                  SizedBox(height: 16),
                  Text(
                    historyPaymentModel.data?[currentIndex].amount ?? "",
                    style: Styles.ts18(Styles.grey4),
                  ),
                  SizedBox(height: 12),
                  Divider(color: Styles.backgroundColor2),
                  Text(
                    'Дата',
                    style: Styles.ts16(Styles.grey4),
                  ),
                  SizedBox(height: 16),
                  Text(
                    historyPaymentModel.data?[currentIndex].createdAt ?? "",
                    style: Styles.ts18(Styles.grey4),
                  ),
                  SizedBox(height: 12),
                  Divider(color: Styles.backgroundColor2),
                  Text(
                    'Время',
                    style: Styles.ts16(Styles.grey4),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Исправить',
                    style: Styles.ts16(Styles.grey4),
                  ),
                  SizedBox(height: 12),
                  Divider(color: Styles.backgroundColor2),
                  Text(
                    'Статус перевода',
                    style: Styles.ts16(Styles.grey4),
                  ),
                  SizedBox(height: 16),
                  Text(
                    historyPaymentModel.data?[currentIndex].user?.phone ?? "",
                    style: Styles.ts18(Styles.grey4),
                  ),
                  SizedBox(height: 12),
                  Divider(color: Styles.backgroundColor2),
                  Spacer(),
                  CustomButton(
                      text: "Отправить повторно",
                      onPressed: () {
                        Navigator.pop(context);
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          backgroundColor: Styles.backgroundColor,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return FractionallySizedBox(
                              heightFactor: 0.9,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  color: Styles.backgroundColor,
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () => Navigator.pop(context),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4.0),
                                            child: Icon(
                                              CupertinoIcons.clear,
                                              color: Styles.backgroundColor2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      historyPaymentModel
                                              .data?[currentIndex].details ??
                                          '',
                                      style: Styles.ts24(
                                        Styles.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 36),
                                    Text(
                                      'Номер кошелька',
                                      style: Styles.ts16(Styles.grey4),
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      historyPaymentModel.data?[currentIndex]
                                              .user?.phone ??
                                          "",
                                      style: Styles.ts18(Styles.grey4),
                                    ),
                                    SizedBox(height: 12),
                                    Divider(color: Styles.backgroundColor2),
                                    Text(
                                      'Сумма',
                                      style: Styles.ts16(Styles.grey4),
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      historyPaymentModel
                                              .data?[currentIndex].amount ??
                                          "",
                                      style: Styles.ts18(Styles.grey4),
                                    ),
                                    SizedBox(height: 12),
                                    Divider(color: Styles.backgroundColor2),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      backgroundColor: Styles.backgroundColor2),
                  SizedBox(height: 40)
                ],
              ),
            ),
          );
        },
      ),
      child: Container(
        margin: const EdgeInsets.only(
          top: 15,
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Styles.backgroundColor2,
                  child: Text('img'),
                  radius: 22,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Styles.getWidth(context) * 0.7,
                      child: Text(
                        historyPaymentModel.data?[currentIndex].details ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Styles.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      double.tryParse(
                            historyPaymentModel.data?[currentIndex].amount ??
                                '',
                          )?.toStringAsFixed(2) ??
                          '',
                      style: Styles.ts18(Styles.green),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 5,
              thickness: 1,
              color: Color(0xff033144),
              indent: 60,
            )
          ],
        ),
      ),
    );
  }
}
