import 'package:flutter/material.dart';

class CareerTimelineData {
  String companyPosition;

  String companyName;

  String? roleDescription;

  DateTime startDate;

  DateTime? endDate;

  IconData icon;

  bool fontAwesomeIcon;

  bool isVisible;

  bool onHover;

  CareerTimelineData({
    this.companyPosition = '',
    this.companyName = '',
    this.roleDescription,
    required this.startDate,
    this.endDate,
    this.icon = Icons.question_answer,
    this.fontAwesomeIcon = false,
    this.isVisible = true,
    this.onHover = false,
  });
}
