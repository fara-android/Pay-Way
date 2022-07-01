import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/widgets/scale_animated_container.dart';

class CustomDateTimePicker extends StatefulWidget {
  final String title;
  final Color backgroundColor;
  final Function(DateTime) onChose;
  final String initialDate;
  const CustomDateTimePicker({
    Key? key,
    required this.initialDate,
    required this.title,
    required this.backgroundColor,
    required this.onChose,
  }) : super(key: key);

  @override
  State<CustomDateTimePicker> createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  DateTime? date;

  
  // DateTime dateTime = DateFormat("dd-MM-yyyy").parse(widget.initialDate);
  
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return ScaleAnimationContainer(
      onPressed: () => _showDialog(
        CupertinoDatePicker(
          initialDateTime: date,
          mode: CupertinoDatePickerMode.date,
          use24hFormat: true,
          onDateTimeChanged: (DateTime newDate) {
            widget.onChose(newDate);
            setState(() => date = newDate);
          },
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Container(
            child: Text(
              date != null
                  ? '${date!.day}/${date!.month}/${date!.year}'
                  : widget.initialDate,
              style: Styles.ts16(Styles.white),
            ),
          ),
          Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
