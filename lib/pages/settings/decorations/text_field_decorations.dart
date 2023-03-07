import 'package:flutter/material.dart';

final InputDecoration kUsersNewNameDecoration = InputDecoration(
  hintText: 'Full name',
  prefixIcon: const Icon(Icons.person),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.grey),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Color(0xFF1565C0),
    ),
  ),
);

final InputDecoration kEmailDecoration = InputDecoration(
  hintText: 'Email',
  prefixIcon: const Icon(Icons.email),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.grey),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Color(0xFF1565C0),
    ),
  ),
);

final InputDecoration kPasswordDecoration = InputDecoration(
  hintText: 'Password',
  prefixIcon: const Icon(Icons.lock),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.grey),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Color(0xFF1565C0),
    ),
  ),
);

final InputDecoration kNewGroupFieldDecoration =  InputDecoration(
  hintText: 'Name to your group',
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.grey),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Color(0xFF1565C0),
    ),
  ),
);
