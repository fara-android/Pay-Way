import 'package:flutter/cupertino.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   static const String _title = 'Flutter Code Sample';

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: MyApp._title,
//       home: MyStatelessWidget(),
//     );
//   }
// }

// class MyStatelessWidget extends StatefulWidget {
//   final String title;
//   final Color backgroundColor;
//   final Function(DateTime) onChose;
//   const MyStatelessWidget({
//     Key? key,
//     required this.title,
//     required this.backgroundColor,
//     required this.onChose,
//   }) : super(key: key);

//   @override
//   State<MyStatelessWidget> createState() => _MyStatelessWidgetState();
// }

// class _MyStatelessWidgetState extends State<MyStatelessWidget> {
//   DateTime date = DateTime(2016, 10, 26);
//   DateTime time = DateTime(2016, 5, 10, 22, 35);
//   DateTime dateTime = DateTime(2016, 8, 3, 17, 45);

//   // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoDatePicker.
//   void _showDialog(Widget child) {
//     showCupertinoModalPopup<void>(
//         context: context,
//         builder: (BuildContext context) => Container(
//               height: 216,
//               padding: const EdgeInsets.only(top: 6.0),
//               // The Bottom margin is provided to align the popup above the system navigation bar.
//               margin: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom,
//               ),
//               // Provide a background color for the popup.
//               color: CupertinoColors.systemBackground.resolveFrom(context),
//               // Use a SafeArea widget to avoid system overlaps.
//               child: SafeArea(
//                 top: false,
//                 child: child,
//               ),
//             ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       child: DefaultTextStyle(
//         style: TextStyle(
//           color: CupertinoColors.label.resolveFrom(context),
//           fontSize: 22.0,
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               _DatePickerItem(
//                 children: <Widget>[
//                   const Text('Date'),
//                   CupertinoButton(
//                     // Display a CupertinoDatePicker in date picker mode.
//                     onPressed: () => _showDialog(
//                       CupertinoDatePicker(
//                         initialDateTime: date,
//                         mode: CupertinoDatePickerMode.date,
//                         use24hFormat: true,
//                         // This is called when the user changes the date.
//                         onDateTimeChanged: (DateTime newDate) {
//                           setState(() => date = newDate);
//                         },
//                       ),
//                     ),
//                     // In this example, the date value is formatted manually. You can use intl package
//                     // to format the value based on user's locale settings.
//                     child: Text(
//                       '${date.month}-${date.day}-${date.year}',
//                       style: const TextStyle(
//                         fontSize: 22.0,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               _DatePickerItem(
//                 children: <Widget>[
//                   const Text('Time'),
//                   CupertinoButton(
//                     // Display a CupertinoDatePicker in time picker mode.
//                     onPressed: () => _showDialog(
//                       CupertinoDatePicker(
//                         initialDateTime: time,
//                         mode: CupertinoDatePickerMode.time,
//                         use24hFormat: true,
//                         // This is called when the user changes the time.
//                         onDateTimeChanged: (DateTime newTime) {
//                           setState(() => time = newTime);
//                         },
//                       ),
//                     ),
//                     // In this example, the time value is formatted manually. You can use intl package to
//                     // format the value based on the user's locale settings.
//                     child: Text(
//                       '${time.hour}:${time.minute}',
//                       style: const TextStyle(
//                         fontSize: 22.0,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               _DatePickerItem(
//                 children: <Widget>[
//                   const Text('DateTime'),
//                   CupertinoButton(
//                     // Display a CupertinoDatePicker in dateTime picker mode.
//                     onPressed: () => _showDialog(
//                       CupertinoDatePicker(
//                         initialDateTime: dateTime,
//                         use24hFormat: true,
//                         // This is called when the user changes the dateTime.
//                         onDateTimeChanged: (DateTime newDateTime) {
//                           setState(() => dateTime = newDateTime);
//                         },
//                       ),
//                     ),
//                     // In this example, time value is formatted manually. You can use intl package to
//                     // format the value based on the user's locale settings.
//                     child: Text(
//                       '${dateTime.month}-${dateTime.day}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}',
//                       style: const TextStyle(
//                         fontSize: 22.0,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // This class simply decorates a row of widgets.
// class _DatePickerItem extends StatelessWidget {
//   const _DatePickerItem({required this.children});

//   final List<Widget> children;

//   @override
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//       decoration: const BoxDecoration(
//         border: Border(
//           top: BorderSide(
//             color: CupertinoColors.inactiveGray,
//             width: 0.0,
//           ),
//           bottom: BorderSide(
//             color: CupertinoColors.inactiveGray,
//             width: 0.0,
//           ),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: children,
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';

class CustomDateTimePicker extends StatefulWidget {
  final String title;
  final Color backgroundColor;
  final Function(DateTime) onChose;
  CustomDateTimePicker({
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.onChose,
  }) : super(key: key);

  @override
  _CustomDateTimePickerState createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  DateTime? pickedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Styles.ts16(Styles.white.withOpacity(0.5)),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            title: pickedDate != null
                ? Text(
                    " ${pickedDate!.day} / ${pickedDate!.month} / ${pickedDate!.year}",
                    style: Styles.ts16(Styles.white),
                  )
                : Text(
                    "Выберите дату",
                    style: Styles.ts16(Styles.white),
                  ),
            trailing: Icon(
              Icons.keyboard_arrow_down,
              color: Styles.white,
            ),
            onTap: () {
              _pickDate();
            },
          ),
        )
      ],
    );
  }

  _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        pickedDate = date;
        widget.onChose(pickedDate!);
      });
    }
  }
}
