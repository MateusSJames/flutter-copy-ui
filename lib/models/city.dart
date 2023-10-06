import 'package:flutter/material.dart';

class City {
  final int id;
  final String name;
  final String bio;
  final String location;
  final String adm;
  final String moderators1;
  final String moderators2;

  City({
    required this.id,
    required this.name,
    required this.bio,
    required this.location,
    required this.adm,
    required this.moderators1,
    required this.moderators2
  });
}