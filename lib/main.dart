
import 'package:app_fem_nage/app.dart';
import 'package:app_fem_nage/counter_observer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main(){
  Bloc.observer = const CounterObserver();
  runApp(  const CounterApp() );

} //main