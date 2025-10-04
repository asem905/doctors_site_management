// ignore_for_file: non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_proj/core/helpers/extensions.dart';
import 'package:flutter_complete_proj/core/networking/api_error_handler.dart';
import 'package:flutter_complete_proj/core/networking/api_result.dart';
import 'package:flutter_complete_proj/features/home/data/models/specializations_response_model.dart';
import '../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());
  List<SpecializationsData?>? specializations = [];
  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(
      success: (specializationsResponseModel) {
        specializations = specializationsResponseModel.specializationDataList??[];
        getDoctorsList(specializations!.first!.id!); //get doctors list for the first specialization by default
        emit(HomeState.specializationsSuccess(specializations));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationsError(errorHandler));
      },
    );
  }
  void getDoctorsList(int specializationId){
    List<Doctors?>? DoctorsList = getDoctorsListBySpecializationId(specializationId);
    if(DoctorsList.isNullOrEmpty()){
      emit(HomeState.doctorsSuccess(DoctorsList));
    }else{
      emit(HomeState.doctorsError(ErrorHandler.handle("No doctors found for this specialization")));
    }
  }
  /// Helper method to filter specialization list by ID to get doctors list for that specialization
  getDoctorsListBySpecializationId(int specializationId){
    return specializations?.firstWhere((element) => element?.id == specializationId)?.doctorsList??[];
  }
}