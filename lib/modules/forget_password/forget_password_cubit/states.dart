abstract class ForgetPasswordStates
{}

class ForgetPasswordInitialState extends ForgetPasswordStates
{}

class SendCodeLoadingState extends ForgetPasswordStates
{}

class SendCodeSuccessState extends ForgetPasswordStates
{}

class SendCodeErrorState extends ForgetPasswordStates
{}

class VerifyCodeLoadingState extends ForgetPasswordStates
{}

class VerifyCodeSuccessState extends ForgetPasswordStates
{}

class VerifyCodeErrorState extends ForgetPasswordStates
{}

class ResetPasswordLoadingState extends ForgetPasswordStates
{}

class ResetPasswordSuccessState extends ForgetPasswordStates
{}

class ResetPasswordErrorState extends ForgetPasswordStates
{}