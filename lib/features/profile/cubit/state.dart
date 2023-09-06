abstract class ProfileState {}

class InitProfileState extends ProfileState {}

class LoadingGetProfile extends ProfileState {}

class LoadedGetProfile extends ProfileState {}

class ErrorGetProfile extends ProfileState {}

class LoadingDeleteProfile extends ProfileState {}

class LoadedDeleteProfile extends ProfileState {}

class ErrorDeleteProfile extends ProfileState {}
