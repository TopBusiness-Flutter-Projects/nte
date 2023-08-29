abstract class SignUpState {}

class InitSignUpState extends SignUpState {}

class ChangePasswordModeState extends SignUpState {}

class ChangeConfirmPasswordState extends SignUpState {}

class ClientOrUserState extends SignUpState {}

class LoadingSighUpAuth extends SignUpState {}

class LoadedSighUpAuth extends SignUpState {}

class ErrorSighUpAuth extends SignUpState {}

class LoadingGetCities extends SignUpState {}

class LoadedGetCities extends SignUpState {}

class ErrorGetCities extends SignUpState {}
