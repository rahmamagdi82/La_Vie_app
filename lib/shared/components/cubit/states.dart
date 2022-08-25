abstract class LaviaStates {}

class InitialState extends LaviaStates {}

// class GetUserLoadingState extends LaviaStates {}
//
// class GetUserErrorState extends LaviaStates
// {
//   final String error;
//   GetUserErrorState(this.error);
// }
//
// class GetUserSuccessState extends LaviaStates {}

class ChangeState extends LaviaStates {}

class ScanState extends LaviaStates {}

class GetProductsLoadingState extends LaviaStates {}

class GetProductsErrorState extends LaviaStates
{
  final String error;
  GetProductsErrorState(this.error);
}

class GetProductsSuccessState extends LaviaStates {}

// class GetPlantsLoadingState extends LaviaStates {}
//
// class GetPlantsErrorState extends LaviaStates
// {
//   final String error;
//   GetPlantsErrorState(this.error);
// }
//
// class GetPlantsSuccessState extends LaviaStates {}

class ChangeBorderColorState extends LaviaStates {}

class ChangeCounterState extends LaviaStates {}

class AddToCartState extends LaviaStates {}

class RemoveFromCartState extends LaviaStates {}

class GetFilterProductsLoadingState extends LaviaStates {}

class GetFilterProductsSuccessState extends LaviaStates {}