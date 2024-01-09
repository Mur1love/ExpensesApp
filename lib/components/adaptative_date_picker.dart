import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeDatePicker extends StatelessWidget {


  final DateTime selectedDate;
  final Function (DateTime) onDateChanged;


  const AdaptativeDatePicker({super.key, 
   required this.selectedDate, 
   required this.onDateChanged,  
   });


  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onDateChanged(pickedDate);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Platform.isIOS 
    ? SizedBox(
      height: 180,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date, 
        initialDateTime: DateTime.now(),
        minimumDate: DateTime(2019),
        maximumDate: DateTime.now(),
        onDateTimeChanged: onDateChanged,
      ),
    )
    
    : SizedBox(
        height: 70,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                selectedDate == null
                    ? 'Nenhuma data selecionada!'
                    : 'Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate!)}',
              ),
            ),
            TextButton(
              onPressed: () => _showDatePicker(context),
              child: const Text(
                'Selecionar Data',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      );
  } 
}