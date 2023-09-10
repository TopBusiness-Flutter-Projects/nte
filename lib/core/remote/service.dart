// import 'package:http/http.dart' as http;

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nte/core/api/end_points.dart';
import 'package:nte/core/models/allplaces.dart';
import 'package:nte/core/models/city_model.dart';

import '../api/base_api_consumer.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';
import '../models/allorder_driver.dart';
import '../models/completed_order_driver.dart';
import '../models/login_model.dart';
import '../models/nullmodel.dart';
import '../models/order_details_driver.dart';
import '../models/orderdetails.dart';
import '../models/ordersmodel.dart';
import '../preferences/preferences.dart';

class ServiceApi {
  final BaseApiConsumer dio;

  ServiceApi(this.dio);
  Future<Either<Failure, LoginModel>> loginAuth({
    required String email,
    required String password,
    required String type,
  }) async {
    String lan = await Preferences.instance.getSavedLang();

    try {
      var response = await dio.post(
        EndPoints.loginUrl,
        body: {"email": email, "password": password, "type": type},
        options: Options(
          headers: {'Accept-Language': lan},
        ),
      );
      return Right(LoginModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, LoginModel>> registerAuth({
    required String name,
    required String email,
    required String password,
    required String password_confirmation,
    required int national_id,
    required int phone,
    required int city_id,
    required String user_type,
  }) async {
    String lan = await Preferences.instance.getSavedLang();

    try {
      var response = await dio.post(
        EndPoints.registerUrl,
        body: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": password_confirmation,
          "national_id": national_id,
          "phone": phone,
          "city_id": city_id,
          "type": "user",
          "user_type": user_type,
        },
        options: Options(
          headers: {'Accept-Language': lan},
        ),
      );
      return Right(LoginModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, Cities>> getCities() async {
    String lan = await Preferences.instance.getSavedLang();

    try {
      var response = await dio.get(EndPoints.citiesUrl,
          options: Options(headers: {'Accept-Language': lan}));
      return Right(Cities.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, NullModel>> phoneCheck({required String phone}) async {
    try {
      var response =
          await dio.post(EndPoints.checkPhone, body: {"phone": phone});
      return Right(NullModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, NullModel>> resetPassword({
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      var response = await dio.post(EndPoints.resetPassword, body: {
        "phone": phone,
        "password": password,
        "password_confirmation": passwordConfirmation
      });
      return Right(NullModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, OrderModel>> ordersCompleted() async {
    String lan = await Preferences.instance.getSavedLang();

    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.get(
        EndPoints.ordersCompleted,
        options: Options(
          headers: {
            'Authorization': loginModel.data!.token,
            "Accept-Language": lan
          },
        ),
      );
      return Right(OrderModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, OrderModel>> ordersNotCompleted() async {
    String lan = await Preferences.instance.getSavedLang();

    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.get(
        EndPoints.ordersNotCompleted,
        options: Options(
          headers: {
            'Authorization': loginModel.data!.token,
            "Accept-Language": lan
          },
        ),
      );
      return Right(OrderModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, OrderDetailsModel>> orderDetails(
      String orderId) async {
    String lan = await Preferences.instance.getSavedLang();

    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.get(
        EndPoints.orderDetails + orderId,
        options: Options(
          headers: {
            'Authorization': loginModel.data!.token,
            "Accept-Language": lan
          },
        ),
      );
      return Right(OrderDetailsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, NullModel>> deleteOrder(int id) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    String lan = await Preferences.instance.getSavedLang();

    try {
      var response = await dio.delete(
        EndPoints.deleteOrder + id.toString(),
        options: Options(headers: {
          'Authorization': loginModel.data!.token,
          "Accept-Language": lan
        }),
      );
      return Right(NullModel.fromJson(response));
      //
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, LoginModel>> getProfile() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    String lan = await Preferences.instance.getSavedLang();

    try {
      var response = await dio.get(
        EndPoints.getProfile,
        options: Options(headers: {
          'Authorization': loginModel.data!.token,
          "Accept-Language": lan
        }),
      );
      return Right(LoginModel.fromJson(response));
      //
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, NullModel>> deleteAccount() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    String lan = await Preferences.instance.getSavedLang();

    try {
      var response = await dio.post(
        EndPoints.deleteAccount,
        options: Options(headers: {
          'Authorization': loginModel.data!.token,
          "Accept-Language": lan
        }),
      );
      return Right(NullModel.fromJson(response));
      //
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, LoginModel>> updateProfile({
    required String name,
    required String email,
    required int phone,
    File? image,
    required int cityId,
  }) async {
    String lan = await Preferences.instance.getSavedLang();
    LoginModel user = await Preferences.instance.getUserModel();
    try {
      var fileName;
      if (image != null) {
        fileName = image.path.split('/').last;
        var data = await MultipartFile.fromFile(image.path, filename: fileName);
        fileName = data;
      } else {
        fileName = '';
      }
      var response = await dio.post(
        EndPoints.updateProfile,
        formDataIsEnabled: true,
        body: {
          "name": name,
          "email": email,
          "phone": phone,
          "city_id": cityId,
          "image": fileName,
        },
        options: Options(
          headers: {
            'Accept-Language': lan,
            'Authorization': user.data!.token,
          },
        ),
      );
      return Right(LoginModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, LoginModel>> changePassword({
    required String currentPass,
    required String newPass,
    required String confirmPass,
  }) async {
    String lan = await Preferences.instance.getSavedLang();
    LoginModel user = await Preferences.instance.getUserModel();
    try {
      var response = await dio.post(
        EndPoints.changePass,
        body: {
          "current_password": currentPass,
          "new_password": newPass,
          "new_password_confirmation": confirmPass
        },
        options: Options(
          headers: {
            'Accept-Language': lan,
            'Authorization': user.data!.token,
          },
        ),
      );
      return Right(LoginModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, AllPlacesModel>> getAllPlaces() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    String lan = await Preferences.instance.getSavedLang();

    try {
      var response = await dio.get(
        EndPoints.allPlaces,
        options: Options(headers: {
          'Authorization': loginModel.data!.token,
          "Accept-Language": lan
        }),
      );
      return Right(AllPlacesModel.fromJson(response));
      //
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, NullModel>> addNewOrder({
    required File image,
    required int from_warehouse,
    required int to_warehouse,
    required double weight,
    required double qty,
    required double value,
    required String type,
    required String description,
  }) async {
    String lan = await Preferences.instance.getSavedLang();
    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      var fileName;
      fileName = image.path.split('/').last;
      var data = await MultipartFile.fromFile(image.path, filename: fileName);
      fileName = data;
      final response = await dio.post(EndPoints.addOrder,
          options: Options(
            headers: {
              'Authorization': loginModel.data!.token,
              "Accept-Language": lan
            },
          ),
          formDataIsEnabled: true,
          body: {
            "image": fileName ?? '',
            "from_warehouse": from_warehouse,
            "to_warehouse": to_warehouse,
            "weight": weight,
            "qty": qty,
            "value": value,
            "type": type,
            "description": description
          });
      return Right(NullModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, NullModel>> editOrder({
    required File? image,
    required String orderId,
    required int from_warehouse,
    required int to_warehouse,
    required double weight,
    required double qty,
    required double value,
    required String type,
    required String description,
  }) async {
    String lan = await Preferences.instance.getSavedLang();
    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      var fileName;
      if (image != null) {
        fileName = image.path.split('/').last;
        var data = await MultipartFile.fromFile(image.path, filename: fileName);
        fileName = data;
      }
      final response = await dio.post(EndPoints.updateOrder + orderId,
          options: Options(
            headers: {
              'Authorization': loginModel.data!.token,
              "Accept-Language": lan
            },
          ),
          formDataIsEnabled: true,
          body: {
            "image": fileName ?? '',
            "from_warehouse": from_warehouse,
            "to_warehouse": to_warehouse,
            "weight": weight,
            "qty": qty,
            "value": value,
            "type": type,
            "description": description
          });
      return Right(NullModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, CompletedOrderDriver>> ordersCompletedDriver() async {
    String lan = await Preferences.instance.getSavedLang();
    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.get(
        EndPoints.completedOrderDriver,
        options: Options(
          headers: {
            'Authorization': loginModel.data!.token,
            "Accept-Language": lan
          },
        ),
      );
      return Right(CompletedOrderDriver.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, DriverOrderDetails>> orderDetailsDriver(
      String orderId) async {
    String lan = await Preferences.instance.getSavedLang();

    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.get(
        EndPoints.orderDriverDetails + orderId,
        options: Options(
          headers: {
            'Authorization': loginModel.data!.token,
            "Accept-Language": lan
          },
        ),
      );
      return Right(DriverOrderDetails.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, AllOrdersDriversModel>> allOrdersDriver(
      {String? search}) async {
    String lan = await Preferences.instance.getSavedLang();
    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.get(
        EndPoints.allOrdersDriver + (search ?? ''),
        options: Options(
          headers: {
            'Authorization': loginModel.data!.token,
            "Accept-Language": lan
          },
        ),
      );
      return Right(AllOrdersDriversModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  ///orderDetails
  //
//   Future<Either<Failure, LoginModel>> postRegister(
//       String phone, String phoneCode,String name) async {
//     try {
//       var response = await dio.post(
//         EndPoints.registerUrl,
//         body: {
//           'phone': phone,
//           'phone_code': phoneCode,
//           'name': name,
//           //'role_id': 1,
//         },
//       );
//
//         return Right(LoginModel.fromJson(response));
//
//
//
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//   //
//   // Future<Either<Failure, ServiceStoreModel>> postServiceStore(ServiceModel serviceModel) async {
//   //   LoginModel loginModel = await Preferences.instance.getUserModel();
//   //
//   //   try {
//   //     List<MultipartFile> images = [];
//   //     for (int i = 0; i < serviceModel.images.length; i++) {
//   //
//   //       var image =  await MultipartFile.fromFile(serviceModel.images[i]!.path)  ;
//   //       images.add(image);
//   //     }      List phones = [];
//   //     for(int i = 0 ; i<serviceModel.phones.length ; i++){
//   //       phones.add(serviceModel.phones[i]);
//   //     }
//   //     final response = await dio.post(
//   //       EndPoints.serviceStoreUrl,
//   //       formDataIsEnabled: true,
//   //       options: Options(
//   //         headers: {'Authorization': loginModel.data!.accessToken!},
//   //       ),
//   //       body: {
//   //         'name': serviceModel.name,
//   //         "category_id":serviceModel.category_id,
//   //         "sub_category_id":serviceModel.sub_category_id,
//   //         "city_id":serviceModel.cityId,
//   //         "phones[]": phones,
//   //         "details":serviceModel.details,
//   //         "logo": await MultipartFile.fromFile(serviceModel.logo.path),
//   //         "location":serviceModel.location,
//   //         "images[]":images,
//   //         "longitude":serviceModel.longitude,
//   //         "latitude":serviceModel.latitude,
//   //       },
//   //     );
//   //     return Right(ServiceStoreModel.fromJson(response));
//   //   } on ServerException {
//   //
//   //     return Left(ServerFailure());
//   //   }
//   // }
//
//   Future<Either<Failure,UpdatedModel >> edit(ServiceToUpdate serviceToUpdate,catId) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//
//     try {
//       List<MultipartFile> images = [];
//       for (int i = 0; i < serviceToUpdate.images!.length; i++) {
//
//         var image =  await MultipartFile.fromFile(serviceToUpdate.images?[i]!.path)  ;
//         images.add(image);
//       }      List phones = [];
//       for(int i = 0 ; i<serviceToUpdate.phones!.length ; i++){
//         phones.add(serviceToUpdate.phones?[i]);
//       }
//       final response = await dio.post(
//         EndPoints.editServicesUrl + catId.toString(),
//
//         formDataIsEnabled: true,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//         body: {
//           'name': serviceToUpdate.name,
//           "category_id":serviceToUpdate.categoryId,
//          // "sub_category_id":1,
//           "phones[]": phones,
//           "details":serviceToUpdate.details,
//            "city_id":serviceToUpdate.cityId,
//           "longitude":serviceToUpdate.longitude,
//           "latitude":serviceToUpdate.latitude,
//           "logo": serviceToUpdate.logo,
//           "location":serviceToUpdate.location,
//           "images[]":images,
//         },
//       );
//       return Right(UpdatedModel.fromJson(response));
//     } on ServerException {
//
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, RateResponseModel>> postRate({required serviceId,required value,comment}) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//
//       final response = await dio.post(
//         EndPoints.rateUrl,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//         body: {
//           'service_id': serviceId,
//           "value":value,
//           "comment":comment
//         },
//       );
//       return Right(RateResponseModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//
//   Future<Either<Failure, LoginModel>> postEditProfile(
//       String name) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//
//     try {
//       final response = await dio.post(
//         EndPoints.updateProfileUrl,
//         options: Options(headers: {"Authorization":loginModel.data!.accessToken!}),
//         body: {
//           'name': name,
//           "phone":loginModel.data?.user?.phone,
//         },
//       );
//
//       return Right(LoginModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//
//   Future<Either<Failure, LoginModel>> postLogin(
//       String phone, String phoneCode) async {
//     try {
//       final response = await dio.post(
//         EndPoints.loginUrl,
//         body: {
//           'phone': phone,
//         },
//       );
//       return Right(LoginModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, HomeModel>> homeData() async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.homeUrl,
//         options: Options(
//           headers: {'Authorization': loginModel.data?.accessToken!},
//         ),
//       );
//       return Right(HomeModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, CategoriesServicesModel>> servicesData(
//       int catId) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.servicesUrl + catId.toString(),
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//       );
//       return Right(CategoriesServicesModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//   Future<Either<Failure, UpdatedModel>> editService(
//       int catId,ServiceToUpdate serviceToUpdate) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//
//     try {
//
//       List<MultipartFile> images = [];
//       for (int i = 0; i < serviceToUpdate.images!.length; i++) {
//
//         var imageFile = serviceToUpdate.images![i];
//         if (imageFile.path.startsWith('http')) {
//           // This is a remote URL, so we need to download the image and save it locally before uploading it
//           var response = await http.get(Uri.parse(imageFile.path));
//           var bytes = response.bodyBytes;
//           var tempDir = await getTemporaryDirectory();
//           var filePath = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
//           await File(filePath).writeAsBytes(bytes);
//           var image = await MultipartFile.fromFile(filePath);
//           images.add(image);
//         } else {
//           // This is a local file, so we can create a MultipartFile object from it
//           var image = await MultipartFile.fromFile(imageFile.path);
//           images.add(image);
//         }
//       }
//       final response = await dio.post(
//         EndPoints.editServicesUrl + catId.toString(),
//
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//         body: {
//           "name":serviceToUpdate.name,
//           "category_id":serviceToUpdate.categoryId,
//           "sub_category_id":serviceToUpdate.subCategoryId,
//           "phones[0]":serviceToUpdate.phones?[0],
//           "phones[1]":serviceToUpdate.phones?[1],
//           "details":serviceToUpdate.details,
//          // "logo":serviceToUpdate.logo,
//           //"logo": await MultipartFile.fromFile(serviceToUpdate.logo!),
//           "logo": !serviceToUpdate.logo!.path.startsWith("http")?await MultipartFile.fromFile(serviceToUpdate.logo!.path):null,
//           "location":serviceToUpdate.location,
//           "images[]":images,
//
//         }
//
//       );
//      print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//       print(response);
//       return Right(UpdatedModel.fromJson(response));
//     } on ServerException {
//       print("erroooooor");
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, CategoriesServicesModel>> servicesSearchData(
//       int catId,searchKey) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.servicesUrl + catId.toString(),
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//         queryParameters: {"search_key":searchKey}
//       );
//       return Right(CategoriesServicesModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, FavoriteModel>>getFavoriteData() async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.favoriteUrl ,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//       );
//       return Right(FavoriteModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure,CitiesModel>> getCities()async{
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try{
//       final response = await dio.get(
//           EndPoints.citiesUrl,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//       );
//       return Right(CitiesModel.fromJson(response));
//     } on ServerException{
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, FavoriteModel>>getFavoriteSearchData(searchKey) async {
//
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.favoriteUrl ,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//         queryParameters: {"search_key":searchKey}
//       );
//
//       return Right(FavoriteModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, MyServicesModel>>getMyServicesData() async {
//
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.myServicesUrl ,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//       );
//       return Right(MyServicesModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//
//   Future<Either<Failure, MyServicesModel>>getMyServicesSearchData(searchKey) async {
//
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//
//       final response = await dio.get(
//         EndPoints.myServicesUrl ,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//         queryParameters: {"search_key":searchKey}
//
//       );
//
//       return Right(MyServicesModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   // Future<Either<Failure, NotificationModel>>getNotifications() async {
//   //
//   //   LoginModel loginModel = await Preferences.instance.getUserModel();
//   //   try {
//   //
//   //     final response = await dio.get(
//   //         EndPoints.notificationUrl ,
//   //         options: Options(
//   //           headers: {'Authorization': loginModel.data!.accessToken!},
//   //         ),
//   //
//   //
//   //     );
//   //
//   //     return Right(NotificationModel.fromJson(response));
//   //   } on ServerException {
//   //     return Left(ServerFailure());
//   //   }
//   // }
//   //
//
//
//
//   Future<Either<Failure, CategoriesModel>>getCategoriesData() async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.categoriesUrl ,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//       );
//       return Right(CategoriesModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, SettingModel>> getSettingData() async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.settingUrl,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//       );
//
//       return Right(SettingModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure,AddToFavouriteResponseModel>> addToFavourite(serviceId) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
// try{
//
//   final response = await dio.post(
//       EndPoints.addToFavouriteUrl,
//       options: Options(
//         headers: {"Authorization":loginModel.data!.accessToken},
//       ),
//       body: {"service_id":serviceId}
//   );
//   return Right(AddToFavouriteResponseModel.fromJson(response));
// } on ServerException{
//   return Left(ServerFailure());
// }
//   }

  // Future<Either<Failure, SearchModel>> search(searchKey) async {
  //   LoginModel loginModel = await Preferences.instance.getUserModel();
  //
  //   try {
  //     final response = await dio.get(
  //       EndPoints.searchUrl+searchKey,
  //       options: Options(
  //         headers: {'Authorization': loginModel.data!.accessToken!},
  //       ),
  //     );
  //     return Right(SearchModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }
}
