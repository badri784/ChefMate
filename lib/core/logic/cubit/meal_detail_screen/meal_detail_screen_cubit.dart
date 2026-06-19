import 'package:flutter_bloc/flutter_bloc.dart';
part 'meal_detail_screen_state.dart';

class MealDetailScreenCubit extends Cubit<MealDetailScreenState> {
  MealDetailScreenCubit() : super(MealDetailScreenInitial());
}
