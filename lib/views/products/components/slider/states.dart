part of 'cubit.dart';
class sliderStates{}

class GetSliderLoadingState extends sliderStates{}
class GetSliderFailedState extends sliderStates{
  final String msg ;

  GetSliderFailedState({required this.msg});
}
class GetSliderSuccessState extends sliderStates{
  final List<SliderModel>list;

  GetSliderSuccessState({required this.list});
}

