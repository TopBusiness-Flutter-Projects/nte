abstract class AddNewOrderState {}

class AddNewOrderInitial extends AddNewOrderState {}

class Adding1NewOffer extends AddNewOrderState {}

class Adding2NewOffer extends AddNewOrderState {}

class Adding3NewOffer extends AddNewOrderState {}

class LoadingGetAllPlaces extends AddNewOrderState {}

class LoadedGetAllPlaces extends AddNewOrderState {}

class ErrorGetAllPlaces extends AddNewOrderState {}

class ChangePlacesSource extends AddNewOrderState {}

class ChangePlacesDestination extends AddNewOrderState {}
