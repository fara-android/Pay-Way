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
  late DateTime pickedDate;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
  }

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
            title: Text(
              " ${pickedDate.day}.${pickedDate.month}.${pickedDate.year}.",
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
      initialDate: pickedDate,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        pickedDate = date;
        widget.onChose(pickedDate);
      });
    }
  }
}
