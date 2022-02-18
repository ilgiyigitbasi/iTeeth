import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime selectedTime;
  final onConfirm;
  final Widget title;
  const CustomDatePicker({required this.title,required this.selectedTime,required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DatePicker.showDateTimePicker(context,
            showTitleActions: true,
            theme: const DatePickerTheme(
              headerColor: Color.fromRGBO(1, 24, 38, 1),
              backgroundColor: Colors.white,
              itemStyle: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  color:  Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
            ), onChanged: (date) {
              print('change $date in time zone ' +
                  date.timeZoneOffset.inHours.toString());
            },
            onConfirm: onConfirm,
            currentTime: DateTime.now(),
            locale: LocaleType.tr);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          Container(
            padding: const EdgeInsets.only(bottom: 10.0,left: 10.0,top: 15.0),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFC4C4C4),
                    width: 1,
                  )
              ),
            ),
            child: Row(
              children:  [

                const SizedBox(
                  width: 10,
                ),
                Text(
                  DateFormat('dd/MM/yyy').format(selectedTime),
                  style: const TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      fontSize:  16,
                      letterSpacing: 0.2,
                      color: Colors.grey
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}