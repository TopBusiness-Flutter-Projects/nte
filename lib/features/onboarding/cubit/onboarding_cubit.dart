import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  PageController pageController = PageController(initialPage: 0) ;
  int numPages = 2 ;
  double currentPage = 0;

  changePages(){
    currentPage = pageController.page!;
    emit(ChangingPagesState());

  }

  onPageChanged(int page){
    currentPage = page.toDouble();
    emit(ChangingPagesState());

  }
}