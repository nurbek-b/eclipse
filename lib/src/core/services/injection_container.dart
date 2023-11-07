import 'package:eclipse_app/src/core/handle_error/network_info.dart';
import 'package:eclipse_app/src/features/explore_people/data/data_source/remote_data_source.dart';
import 'package:eclipse_app/src/features/explore_people/data/repository/repository.dart';
import 'package:eclipse_app/src/features/explore_people/domain/base_repository/base_repository.dart';
import 'package:eclipse_app/src/features/explore_people/domain/use_case/fetch_images_use_case.dart';
import 'package:eclipse_app/src/features/explore_people/domain/use_case/fetch_users_use_case.dart';
import 'package:eclipse_app/src/features/explore_people/presentation/explore_people_bloc/explore_people_bloc.dart';
import 'package:eclipse_app/src/features/explore_people/presentation/images_cubit/images_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final GetIt sl = GetIt.instance;

class AppServiceLocator {
  static Future<void> initAppServiceLocator() async {
    sl.registerFactory<ExplorePeopleBloc>(() => ExplorePeopleBloc(sl()));
    sl.registerFactory<ImagesCubit>(() => ImagesCubit(sl()));

    sl.registerLazySingleton<GetDataUseCase>(
        () => GetDataUseCase(baseRepo: sl()));

    sl.registerLazySingleton<GetImagesUseCase>(
        () => GetImagesUseCase(baseRepo: sl()));

    sl.registerLazySingleton<BaseRepo>(
        () => Repo(networkInfo: sl(), remoteData: sl()));

    sl.registerLazySingleton<RemoteData>(() => RemoteDataImpl());

    // Network information
    sl.registerLazySingleton(() => InternetConnectionChecker());
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  }
}
