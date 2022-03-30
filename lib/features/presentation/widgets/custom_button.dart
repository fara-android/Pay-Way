import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/widgets/scale_animated_container.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final GestureTapCallback onPressed;
  final Color? backgroundColor;
  final bool loading;
  final double width;
  final double height;
  final bool isDisabled;

  CustomButton({
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    this.loading = false,
    this.width = 0.0,
    this.height = 56.0,
    this.isDisabled = false,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late Color? color;

  @override
  void initState() {
    super.initState();
    color = widget.backgroundColor;
  }

  @override
  void didUpdateWidget(_) {
    color = widget.backgroundColor;
    super.didUpdateWidget(_);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 2000),
      height: widget.height,
      width:
          widget.width > 0 ? widget.width : MediaQuery.of(context).size.width,
      child: !widget.isDisabled
          ? ScaleAnimationContainer(
              child: GestureDetector(
                  onTapDown: (_) {
                    setState(() {
                      if (widget.backgroundColor == Colors.transparent) {
                        color = Colors.grey.withOpacity(0.1);
                      } else {
                        color = widget.backgroundColor?.withOpacity(0.9);
                      }
                    });
                  },
                  onTapUp: (_) {
                    setState(() {
                      color = widget.backgroundColor;
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      color = widget.backgroundColor;
                    });
                  },
                  onTap: widget.loading ? () {} : widget.onPressed,
                  child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      alignment: Alignment.center,
                      child: widget.loading
                          ? CircularProgressIndicator(
                              strokeWidth: 3.0,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Styles.white))
                          : Text(widget.text,
                              style: Styles.ts16(Styles.white)))),
            )
          : Container(
              decoration: BoxDecoration(
                  color: Styles.inActiveColor,
                  borderRadius: BorderRadius.circular(12.00),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 1,
                    style: BorderStyle.solid,
                  )),
              child: Align(
                  child: Text(widget.text, style: Styles.ts16(Styles.white))),
            ),
    );
  }
}
