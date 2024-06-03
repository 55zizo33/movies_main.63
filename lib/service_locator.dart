import 'package:get_it/get_it.dart';
import 'package:project/core/dio_helper.dart';
import 'package:project/views/login/cubit.dart';
import 'package:project/views/products/components/slider/cubit.dart';
import 'features/contact_us/bloc.dart';
import 'views/counter/cubit.dart';
import 'views/products/components/category_section/cubit.dart';
import 'views/products/components/products/cubit.dart';
import 'views/terms/cubit.dart';

void initServiceLocator()
{
  final container = GetIt.instance;
container.registerSingleton(DioHelper());

  container.registerFactory(() => LoginCubit(GetIt.I<DioHelper>()));
  container.registerFactory(() => ContactUsBloc(GetIt.I<DioHelper>()));
  container.registerFactory(() => TermsCubit(GetIt.I<DioHelper>())..getData());
  container.registerFactory(() => CounterCubit());
  container.registerFactory(() => CategoriesCubit(GetIt.I<DioHelper>())..getData());
  container.registerFactory(() => SliderCubit(GetIt.I<DioHelper>())..getData());
  container.registerFactory(() => ProductsCubit(GetIt.I<DioHelper>())..getData());
}