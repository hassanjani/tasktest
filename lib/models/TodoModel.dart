import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tasktest/models/BreweryModel.dart';

class TodoModel extends ChangeNotifier {

   List<Brewry> brewerylist=[];
   setbrewrylist(List<Brewry> list){
      brewerylist=list;
      notifyListeners();
   }


}