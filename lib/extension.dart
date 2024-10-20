
import 'package:flutter/cupertino.dart';


extension Print on Object {
  void print() {
    debugPrint(toString());
  }
}