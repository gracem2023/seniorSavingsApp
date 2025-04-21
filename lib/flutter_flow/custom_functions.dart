import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? showSearchResult(
  String? textSearchFor,
  String? textSearchIn,
) {
  if (textSearchFor == null || textSearchIn == null) {
    return false;
  }

  // Convert both strings to lowercase for case-insensitive matching
  return textSearchIn.toLowerCase().contains(textSearchFor.toLowerCase());
}

bool? verifyAge(String? birthYear) {
  if (birthYear == null) {
    return false; // Return false if input is invalid
  }

  // Trim and check if the birthYear is empty
  if (birthYear.trim().isEmpty) {
    return false; // Return false if input is invalid
  }
  try {
    // Convert the birthYear string to an integer
    int year = int.parse(birthYear.trim());
    // Check if the birth year is greater than 1970
    return year < 1975;
  } catch (e) {
    // Return false if parsing fails
    return false;
  }
}
